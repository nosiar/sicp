(load "2.47.scm") ; frame (also load 2.46.scm (vector))
(load "2.48.scm") ; segment

(require racket/draw)

(define path "/home/raison/www/lab/sicp/")
(define width 1024)
(define height 1024)

(define (make-draw-line dc)
  (define (conv v)
    (let ((x (xcor-vect v))
          (y (ycor-vect v)))
      (make-vect (* width (/ (+ x 2) 4))
                 (* height (/ (- 2 y) 4)))))
  (lambda (v1 v2)
    (let ((new-v1 (conv v1))
          (new-v2 (conv v2)))
      (send dc draw-line
            (xcor-vect new-v1) (ycor-vect new-v1)
            (xcor-vect new-v2) (ycor-vect new-v2)))))

(define (make-g w h)
  (let ((target (make-bitmap w h)))
    (let ((dc (new bitmap-dc% [bitmap target])))
      (let ((my-draw-line (make-draw-line dc)))
        (list target dc my-draw-line)))))

(define get-target car)
(define get-dc cadr)
(define get-draw-line caddr)
(define (save g filename)
  (send (get-target g) save-file (string-append path filename) 'png))

; you need to pass an additional argument [g:result of make-g] to the painter.
(define (segment->painter segment-list)
  (lambda (frame g)
    (for-each
      (lambda (segment)
        ((get-draw-line g)
         ((frame-coord-map frame) (start-segment segment))
         ((frame-coord-map frame) (end-segment segment))))
      segment-list)))

;;;;;;;;;;    usgage    ;;;;;;;;;;
;
; (define g (make-g width height))
; (painter default-frame g)
; (save g "result.png")
