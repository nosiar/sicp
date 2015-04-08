(load "lib.scm")

(define (addr a b)
  (if (= a 0)
      b
      (inc (addr (dec a) b))))
; recursive

(define (addi a b)
  (if (= a 0)
      b
      (addi (dec a) (inc b))))
; iterative

(addr 4 5)
(addi 4 5)
