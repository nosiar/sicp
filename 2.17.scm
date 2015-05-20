(define (last-pair-x l)
  (if (null? (cdr l))
      (list (car l))
      (last-pair-x (cdr l))))
