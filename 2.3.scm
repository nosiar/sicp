(load "2.2.scm")

(define (distance p0 p1)
  (let ((x (- (x-point p0) (x-point p1)))
        (y (- (y-point p0) (y-point p1))))
    (sqrt (sqr x) (sqr y))))

(define (make-rect bl tr) (cons bl tr))
(define (bl rect) (car rect))
(define (tr rect) (cdr rect))
(define (width-rect rect)
  (- (x-point (tr rect))
     (x-point (bl rect))))
(define (height-rect rect)
  (- (y-point (tr rect))
     (y-point (bl rect))))

(define (area-rect rect)
  (* (width-rect rect) (height-rect rect)))

(define (perimeter-rect rect)
  (* 2 (+ (width-rect rect) (height-rect rect))))

(area-rect (make-rect (make-point 0 0) (make-point 8 9)))
(perimeter-rect (make-rect (make-point 0 0) (make-point 8 9)))
