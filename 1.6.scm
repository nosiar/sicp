(load "lib.scm")
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))
(new-if (= 2 3) 0 5)
(new-if (= 1 1) 0 5)
(define (sqrt-iter guess x)
  (define (good-enough? guess x)
    (< (abs (- (square guess) x)) 0.001))
  (define (improve guess x)
    (average guess (/ x guess)))
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x)
                     x)))
; (sqrt-iter 1.0 9)
; This will go into infinite loop. The reason is that all arguments of new-if
; should be evaluated before new-if is evaluated because it's just a normal
; procedure.
