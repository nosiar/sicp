(define (square-list items)
  (if (null? items)
      null
      (cons (sqr (car items)) (square-list (cdr items)))))
(define (square-list2 items)
  (map sqr items))
