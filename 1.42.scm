(define (compose f g)
  (lambda (x) (f (g x))))

((compose sqr add1) 6)
