(load "2.11.scm")

(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))
(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))
(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))
(define (percent i)
    (* (/ (width i) (center i)) 100))
(define (make-center-percent c e)
  (let ((w (* c e 0.01)))
    (make-center-width c w)))
