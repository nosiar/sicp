(load "2.40.scm")

(define empty-board null)

(define (adjoin-position new-row k rest-of-queens)
  (cons new-row rest-of-queens))

(define (safe? k positions)
  (define (safe-sub cur positions row)
    (cond ((= cur k) #t)
          ((or (= (+ row cur) (car positions))
               (= row (car positions))
               (= (- row cur) (car positions))) #f)
          (else (safe-sub (add1 cur) (cdr positions) row))))
  (safe-sub 1 (cdr positions) (car positions)))

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
          (lambda (positions) (safe? k positions))
          (flatmap
            (lambda (rest-of-queens)
              (map (lambda (new-row)
                     (adjoin-position new-row k rest-of-queens))
                   (enumerate-interval 1 board-size)))
            (queen-cols (sub1 k))))))
  (queen-cols board-size))
