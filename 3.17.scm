(define (count-pairs-wrong x)
  (if (not (pair? x))
      0
      (+ (count-pairs-wrong (car x))
         (count-pairs-wrong (cdr x))
         1)))

(define (count-pairs x)
  (let ((visited '()))
    (define (count-pairs-helper x)
      (cond ((not (pair? x)) 0)
            ((memq x visited) 0)
            (else (begin (set! visited (cons x visited))
                         (+ (count-pairs-helper (car x))
                            (count-pairs-helper (cdr x))
                            1)))))
    (count-pairs-helper x)))

