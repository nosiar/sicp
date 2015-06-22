(load "pic.scm")

(define (transform-painter painter origin corner1 corner2)
  (lambda (frame g)
    (let ((m (frame-coord-map frame)))
      (let ((new-origin (m origin)))
        (painter
          (make-frame new-origin
                      (sub-vect (m corner1) new-origin)
                      (sub-vect (m corner2) new-origin))
          g)))))


(define (flip-vert painter)
  (transform-painter painter
                     (make-vect 0.0 1.0)
                     (make-vect 1.0 1.0)
                     (make-vect 0.0 0.0)))

(define (flip-horiz painter)
  (transform-painter painter
                     (make-vect 1.0 0.0)
                     (make-vect 0.0 0.0)
                     (make-vect 1.0 1.0)))

(define (rotate90 painter)
  (transform-painter painter
                     (make-vect 1.0 0.0)
                     (make-vect 1.0 1.0)
                     (make-vect 0.0 0.0)))

(define (rotate180 painter)
  (transform-painter painter
                     (make-vect 1.0 1.0)
                     (make-vect 0.0 1.0)
                     (make-vect 1.0 0.0)))

(define (rotate270 painter)
  (transform-painter painter
                     (make-vect 0.0 1.0)
                     (make-vect 0.0 0.0)
                     (make-vect 1.0 1.0)))
(define wave
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
((flip-horiz wave) default-frame g)
(save g "2.50-horiz.png")

(define g (make-g width height))
((rotate180 wave) default-frame g)
(save g "2.50-180.png")

(define g (make-g width height))
((rotate270 wave) default-frame g)
(save g "2.50-270.png")

