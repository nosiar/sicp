(define (make-rat n d)
  (let ((g ((if (< d 0) - +) (gcd n d))))
    (cons (/ n g) (/ d g))))
(define (numer x) (car x))
(define (denom x) (cdr x))
(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))
(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))
(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))))
(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
            (* (denom x) (numer y))))
(define (equal-rat? x y)
  (= (* (numer x) (denom y))
     (* (numer y) (denom x))))
(define (print-rat x)
  (printf "~a/~a~n" (numer x) (denom x)))

(print-rat (make-rat -4 -4))
(print-rat (make-rat -4 4))
(print-rat (make-rat 4 -4))
(print-rat (make-rat 4 4))  
