(define (split p1 p2)
  ((lambda (x) (x x))
   (lambda (gen)
     (lambda (painter n)
       (if (= n 0)
           painter
           (let ((smaller ((gen gen) painter (sub1 n))))
             (p1 painter (p2 smaller smaller))))))))
