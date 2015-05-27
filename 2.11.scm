(load "2.10.scm")

(define (mul-interval-new x y)
  (cond ((and (>= (lower-bound x) 0) (>= (lower-bound y) 0))
         (make-interval (* (lower-bound x) (lower-bound y))
                        (* (upper-bound x) (upper-bound y))))
        ((and (< (upper-bound x) 0) (< (upper-bound y) 0))
         (make-interval (* (upper-bound x) (upper-bound y))
                        (* (lower-bound x) (lower-bound y))))
        ((and (< (upper-bound x) 0) (>= (lower-bound y) 0))
         (make-interval (* (lower-bound x) (upper-bound y))
                        (* (upper-bound x) (lower-bound y))))
        ((and (>= (lower-bound x) 0) (< (upper-bound y) 0))
         (make-interval (* (upper-bound x) (lower-bound y))
                        (* (lower-bound x) (upper-bound y))))
        ((>= (lower-bound x) 0)
         (make-interval (* (upper-bound x) (lower-bound y))
                        (* (upper-bound x) (upper-bound y))))
        ((< (upper-bound x) 0)
         (make-interval (* (lower-bound x) (upper-bound y))
                        (* (lower-bound x) (lower-bound y))))
        ((>= (lower-bound y) 0)
         (make-interval (* (lower-bound x) (upper-bound y))
                        (* (upper-bound x) (upper-bound y))))
        ((< (upper-bound y) 0)
         (make-interval (* (upper-bound x) (lower-bound y))
                        (* (lower-bound x) (lower-bound y))))
        (else
          (make-interval (min (* (lower-bound x) (upper-bound y))
                              (* (upper-bound x) (lower-bound y)))
                         (max (* (upper-bound x) (upper-bound y))
                              (* (lower-bound x) (lower-bound y)))))))

;(define (eql-interval? a b)
;  (and (= (upper-bound a) (upper-bound b))
;       (= (lower-bound a) (lower-bound b))))
;
;(define (ensure-mult-works aL aH bL bH)
;  (let ((a (make-interval aL aH))
;        (b (make-interval bL bH)))
;    (if (eql-interval? (mul-interval a b)
;                       (mul-interval-new a b))
;        true
;        (error "new mult returns different value!"
;               a
;               b
;               (mul-interval a b)
;               (mul-interval-new a b)))))
;
;(ensure-mult-works  +10 +10   +10 +10)
;(ensure-mult-works  +10 +10   +00 +10)
;(ensure-mult-works  +10 +10   +00 +00)
;(ensure-mult-works  +10 +10   -10 -10)
;(ensure-mult-works  +10 +10   -10 -00)
;(ensure-mult-works  +10 +10   -10 +10)
;
;(ensure-mult-works  +00 +10   +10 +10)
;(ensure-mult-works  +00 +10   +00 +10)
;(ensure-mult-works  +00 +10   +00 +00)
;(ensure-mult-works  +00 +10   -10 -10)
;(ensure-mult-works  +00 +10   -10 -00)
;(ensure-mult-works  +00 +10   -10 +10)
;
;(ensure-mult-works  +00 +00   +10 +10)
;(ensure-mult-works  +00 +00   +00 +10)
;(ensure-mult-works  +00 +00   +00 +00)
;(ensure-mult-works  +00 +00   -10 -10)
;(ensure-mult-works  +00 +00   -10 -00)
;(ensure-mult-works  +00 +00   -10 +10)
;
;(ensure-mult-works  -10 +10   +10 +10)
;(ensure-mult-works  -10 +10   +00 +10)
;(ensure-mult-works  -10 +10   +00 +00)
;(ensure-mult-works  -10 +10   -10 -10)
;(ensure-mult-works  -10 +10   -10 -00)
;(ensure-mult-works  -10 +10   -10 +10)
;
;(ensure-mult-works  -10 +00   +10 +10)
;(ensure-mult-works  -10 +00   +00 +10)
;(ensure-mult-works  -10 +00   +00 +00)
;(ensure-mult-works  -10 +00   -10 -10)
;(ensure-mult-works  -10 +00   -10 -00)
;(ensure-mult-works  -10 +00   -10 +10)
;
;(ensure-mult-works  -10 -10   +10 +10)
;(ensure-mult-works  -10 -10   +00 +10)
;(ensure-mult-works  -10 -10   +00 +00)
;(ensure-mult-works  -10 -10   -10 -10)
;(ensure-mult-works  -10 -10   -10 -00)
;(ensure-mult-works  -10 -10   -10 +10)