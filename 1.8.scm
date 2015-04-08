(load "lib.scm")
(define (cbrt-iter guess x)
  (define (improve guess x)
    (/ (+ (* 2 guess) (/ x (square guess))) 3))
  (define (good-enough? guess x)
    (= guess (improve guess x)))
  (if (good-enough? guess x)
      guess
      (cbrt-iter (improve guess x)
                 x)))

(cbrt-iter 1.0 27)
