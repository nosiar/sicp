(load "lib.scm")

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (sum-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ (term a) result))))
  (iter a 0))

(define (sum-cubes a b)
    (sum cube a inc b))

(define (sum-cubes-iter a b)
    (sum-iter cube a inc b))

(sum-cubes 1 10)
(sum-cubes-iter 1 10)
