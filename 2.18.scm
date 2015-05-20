(define (append-x l1 l2)
  (if (null? l1)
      l2
      (cons (car l1) (append-x (cdr l1) l2))))
(define (reverse-x l)
  (if (null? l)
      l
      (append-x (reverse-x (cdr l)) (list (car l)))))
