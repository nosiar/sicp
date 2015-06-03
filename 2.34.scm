(define (horner-eval x coefficient-sequence)
  (foldr (lambda (this-coeff higher-terms) (+ this-coeff (* x higher-terms)))
              0
              coefficient-sequence))
