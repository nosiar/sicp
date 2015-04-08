(define (p) (p))
(define (test x y)
  (if (= x 0)
      0
      y))
; (test 0 (p))
; This will result in an infinite loop because MIT-Scheme uses applicative-order evaluation. If it used normal-order evaluation, the expression would evalute to zero.
