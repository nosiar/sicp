(define (g x)
  (lambda (n)
    (let ((ret x))
      (set! x n) ret)))

; left to right
(define f (g 0))
(define l (f 0))
(define r (f 1))
(+ l r)

; right to left
(define f (g 0))
(define r (f 1))
(define l (f 0))
(+ l r)
