(load "lib.scm")

(define (add1 a b)
  (if (= a 0)
      b
      (inc (add1 (dec a) b))))
; recursive

(define (add2 a b)
  (if (= a 0)
      b
      (add2 (dec a) (inc b))))
; iterative

(add1 4 5)
(add2 4 5)
