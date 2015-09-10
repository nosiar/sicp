;(define (random-in-range low high)
;  (let ((range (- high low)))
;    (+ low (random range))))

(define (random-in-range low high)
  (let ((range (- high low)))
    (+ low (* range (random)))))

(define (monte-carlo trials experiment)
  (define (iter trials-remaining trials-passed)
    (cond ((= trials-remaining 0)
           (/ trials-passed trials))
          ((experiment)
           (iter (- trials-remaining 1) (+ trials-passed 1)))
          (else
            (iter (- trials-remaining 1) trials-passed))))
  (iter trials 0))

(define (estimate-integral p x1 x2 y1 y2 trials)
  (let ((rect-area (* (- x2 x1) (- y2 y1))))
    (* rect-area (monte-carlo trials (lambda () (p (random-in-range x1 x2)
                                                   (random-in-range y1 y2)))))))

(define (predicate x y)
  (< (+ (sqr x) (sqr y)) 1))

(define (estimate-pi trials)
  (estimate-integral predicate -1 1 -1 1 trials))

