;(define (segments->painter segment-list)
;  (lambda (frame)
;    (for-each
;      (lambda (segment)
;        (draw-line
;          ((frame-coord-map frame) (start-segment segment))
;          ((frame-coord-map frame) (end-segment segment))))
;      segment-list)))

(load "pic.scm") ; define new segment->painter which draws to a png file.

(define painter-a
  (segment->painter
    (list (make-segment (make-vect 0.0 0.0) (make-vect 1.0 0.0))
          (make-segment (make-vect 1.0 0.0) (make-vect 1.0 1.0))
          (make-segment (make-vect 1.0 1.0) (make-vect 0.0 1.0))
          (make-segment (make-vect 0.0 1.0) (make-vect 0.0 0.0)))))

(define painter-b
  (segment->painter
    (list (make-segment (make-vect 0.0 0.0) (make-vect 1.0 1.0))
          (make-segment (make-vect 0.0 1.0) (make-vect 1.0 0.0)))))

(define painter-c
  (segment->painter
    (list (make-segment (make-vect 0.5 0.0) (make-vect 1.0 0.5))
          (make-segment (make-vect 1.0 0.5) (make-vect 0.5 1.0))
          (make-segment (make-vect 0.5 1.0) (make-vect 0.0 0.5))
          (make-segment (make-vect 0.0 0.5) (make-vect 0.5 0.0)))))

(define painter-d
  (segment->painter
    (list (make-segment (make-vect 0.401 1.000) (make-vect 0.352 0.852))
          (make-segment (make-vect 0.352 0.852) (make-vect 0.401 0.654))
          (make-segment (make-vect 0.401 0.654) (make-vect 0.302 0.654))
          (make-segment (make-vect 0.302 0.654) (make-vect 0.154 0.604))
          (make-segment (make-vect 0.154 0.604) (make-vect 0.000 0.846))
          (make-segment (make-vect 0.000 0.846) (make-vect 0.000 0.648))
          (make-segment (make-vect 0.000 0.648) (make-vect 0.154 0.407))
          (make-segment (make-vect 0.154 0.407) (make-vect 0.302 0.599))
          (make-segment (make-vect 0.302 0.599) (make-vect 0.352 0.505))
          (make-segment (make-vect 0.352 0.505) (make-vect 0.253 0.005))
          (make-segment (make-vect 0.253 0.005) (make-vect 0.407 0.005))
          (make-segment (make-vect 0.407 0.005) (make-vect 0.500 0.302))
          (make-segment (make-vect 0.500 0.302) (make-vect 0.599 0.005))
          (make-segment (make-vect 0.599 0.005) (make-vect 0.753 0.005))
          (make-segment (make-vect 0.753 0.005) (make-vect 0.599 0.456))
          (make-segment (make-vect 0.599 0.456) (make-vect 0.995 0.154))
          (make-segment (make-vect 0.995 0.154) (make-vect 0.995 0.357))
          (make-segment (make-vect 0.995 0.357) (make-vect 0.747 0.654))
          (make-segment (make-vect 0.747 0.654) (make-vect 0.599 0.654))
          (make-segment (make-vect 0.599 0.654) (make-vect 0.648 0.852))
          (make-segment (make-vect 0.648 0.852) (make-vect 0.599 1.000))
          (make-segment (make-vect 0.599 1.000) (make-vect 0.401 1.000)))))

(define g (make-g width height))
(painter-a default-frame g)
(save g "2.49-a.png")

(define g (make-g width height))
(painter-b default-frame g)
(save g "2.49-b.png")

(define g (make-g width height))
(painter-c default-frame g)
(save g "2.49-c.png")

(define g (make-g width height))
(painter-d default-frame g)
(save g "2.49-d.png")

