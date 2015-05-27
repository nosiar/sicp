(define (for-each-x proc items)
  (if (null? items)
      #t
      (begin (proc (car items)) (for-each-x proc (cdr items)))))

