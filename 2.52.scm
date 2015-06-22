(load "2.51.scm")
(load "2.44.scm") ; up-split and right-split

(define (corner-split painter n)
  (if (= n 0)
      painter
      (let ((up (up-split painter (- n 1)))
            (right (right-split painter (- n 1))))
        (let ((top-left (beside up up))
              (bottom-right (below right right))
              (corner (corner-split painter (- n 1))))
          (beside (below painter top-left)
                  (below bottom-right corner))))))

(define (square-of-four tl tr bl br)
  (lambda (painter)
    (let ((top (beside (tl painter) (tr painter)))
          (bottom (beside (bl painter) (br painter))))
      (below bottom top))))

(define (square-limit painter n)
  (let ((combine4 (square-of-four flip-horiz identity
                                  rotate180 flip-vert)))
    (combine4 (corner-split painter n))))

(define g (make-g width height))
((square-limit wave 4) default-frame g)
(save g "2.52-original.png")

;;;;; a 
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
          (make-segment (make-vect 0.599 1.000) (make-vect 0.401 1.000))
          (make-segment (make-vect 0.410 0.860) (make-vect 0.460 0.860))
          (make-segment (make-vect 0.540 0.860) (make-vect 0.590 0.860))
          (make-segment (make-vect 0.470 0.780) (make-vect 0.530 0.760)))))

(define g (make-g width height))
((square-limit wave 4) default-frame g)
(save g "2.52-a.png")

;;;;; b
(define (corner-split painter n)
  (if (= n 0)
      painter
      (let ((up (up-split painter (- n 1)))
            (right (right-split painter (- n 1))))
        (let ((corner (corner-split painter (- n 1))))
          (beside (below painter up)
                  (below right corner))))))

(define g (make-g width height))
((square-limit wave 4) default-frame g)
(save g "2.52-b.png")

;;;;; c
(define (square-limit painter n)
  (let ((combine4 (square-of-four rotate90 identity
                                  rotate180 rotate270)))
    (combine4 (corner-split painter n))))

(define g (make-g width height))
((square-limit wave 4) default-frame g)
(save g "2.52-c.png")
