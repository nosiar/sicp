(load "lib.scm")

(define (make-point x y) (cons x y))
(define (x-point p) (car p))
(define (y-point p) (cdr p))
(define (print-point p)
  (printf "(~a,~a)" (x-point p) (y-point p)))

(define (make-segment s e) (cons s e))
(define (start-point seg) (car seg))
(define (end-point seg) (cdr seg))
(define (midpoint-segment seg)
  (let ((s (start-point seg))
        (e (end-point seg)))
    (make-point (average (x-point s) (x-point e))
                (average (y-point s) (y-point e)))))

(print-point
  (midpoint-segment
    (make-segment (make-point 2 3)
                  (make-point 10 15))))
