(load "2.46.scm") ; vector

(define (make-frame origin edge1 edge2)
  (list origin edge1 edge2))

(define (origin-frame frame)
  (car frame))

(define (edge1-frame frame)
  (cadr frame))

(define (edge2-frame frame)
  (caddr frame))

(define (make-frame-x origin edge1 edge2)
  (cons origin (cons edge1 edge2)))

(define (origin-frame-x frame)
  (car frame))

(define (edge1-frame-x frame)
  (cadr frame))

(define (edge2-frame-x frame)
  (cddr frame))


(define (frame-coord-map frame)
  (lambda (v)
    (add-vect
      (origin-frame frame)
      (add-vect (scale-vect (xcor-vect v)
                            (edge1-frame frame))
                (scale-vect (ycor-vect v)
                            (edge2-frame frame))))))

(define default-frame (make-frame (make-vect 0 0)
                                  (make-vect 1 0)
                                  (make-vect 0 1)))
