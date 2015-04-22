(load "lib.scm")

(define (iterative-improve good-enough? improve)
  (lambda (guess)
    (let ((next (improve guess)))
      (if (good-enough? guess next)
          guess
          ((iterative-improve good-enough? improve) next)))))

(define (my-sqrt n)
  ((iterative-improve
     (lambda (guess next) (= guess next))
     (lambda (guess) (average guess (/ n guess))))
   1.0))

(define (fixed-point f first-guess)
  ((iterative-improve
     (lambda (guess next) (= guess next))
     (lambda (guess) (average guess (f guess))))
   first-guess))

(my-sqrt 9)
(my-sqrt 23)
(fixed-point cos 1.0)
(fixed-point (lambda (y) (+ (sin y) (cos y)))
             1.0)
