(load "2.50.scm")

(define (beside painter1 painter2)
  (let ((split-point (make-vect 0.5 0.0)))
    (let ((paint-left
            (transform-painter painter1
                               (make-vect 0.0 0.0)
                               split-point
                               (make-vect 0.0 1.0)))
          (paint-right
            (transform-painter painter2
                               split-point
                               (make-vect 1.0 0.0)
                               (make-vect 0.5 1.0))))
      (lambda (frame g)
        (paint-left frame g)
        (paint-right frame g)))))

(define (below painter1 painter2)
  (let ((split-point (make-vect 0.0 0.5)))
    (let ((paint-bottom
            (transform-painter painter1
                               (make-vect 0.0 0.0)
                               (make-vect 1.0 0.0)
                               split-point))
          (paint-top
            (transform-painter painter2
                               split-point
                               (make-vect 1.0 0.5)
                               (make-vect 0.0 1.0))))
      (lambda (frame g)
        (paint-bottom frame g)
        (paint-top frame g)))))

(define (below2 painter1 painter2)
  (rotate180 (rotate270 (beside (rotate270 painter1) (rotate270 painter2)))))

(define wave2 (beside wave (flip-vert wave)))
(define wave3 (below wave (flip-horiz wave)))

(define g (make-g width height))
(wave2 default-frame g)
(save g "2.51-beside.png")

(define g (make-g width height))
(wave3 default-frame g)
(save g "2.51-below-a.png")

(define g (make-g width height))
(wave3 default-frame g)
(save g "2.51-below-b.png")
