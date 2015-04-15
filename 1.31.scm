(load "lib.scm")

(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* (term a) result))))
  (iter a 1))

(define (factorial n)
  (product identity 1 inc n))

(define (factorial-iter n)
  (product-iter identity 1 inc n))

(define (quarter-pi)
  (define (terma k) (+ (- k (remainder k 2)) 2))
  (define (termb k) (+ (terma (- k 1)) 1))
  (define (term k) (/ (terma k) (termb k)))
  (product term 1.0 inc 500000.0))

(factorial 10)
(factorial-iter 10)
(quarter-pi)
