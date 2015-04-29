(define (add-1 n) (lambda (f) (lambda (x) (f ((n f) x)))))
(define zero (lambda (f) (lambda (x) x)))
(define one (lambda (f) (lambda (x) (f x))))
(define two (lambda (f) (lambda (x) (f (f x)))))
(define (add a b) (lambda (f) (lambda (x) ((a f) ((b f) x)))))
(define (print-num n) ((n add1) 0))

(print-num zero) ; 0
(print-num one) ; 1
(print-num two) ; 2
(print-num (add (add one two) two)) ; 5
