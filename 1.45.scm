(load "lib.scm")

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (if (= n 0)
      identity
      (compose (repeated f (- n 1)) f)))

(define (my-sqrt x)
  (fixed-point (average-damp (lambda (y) (/ x y)))
               1.0))
(define (cube-root x)
  (fixed-point (average-damp (lambda (y) (/ x (square y))))
               1.0))

; I don't understand why average-damp should be repeated logn times.
(define (n-root x n)
  (fixed-point ((repeated average-damp (exact-floor (log2 n)))
                (lambda (y) (/ x (expt y (- n 1)))))
               1.0))

(my-sqrt 4)
(cube-root 8)
(n-root 16 4)
(n-root 504036361936467383 13)
