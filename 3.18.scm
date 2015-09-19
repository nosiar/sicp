(require scheme/mpair)

(define (mlast-pair x)
  (if (null? (mcdr x))
      x
      (mlast-pair (mcdr x))))

(define (cycle? x)
  (let ((visited '()))
    (define (cycle?-helper x)
      (cond ((not (mpair? x)) false)
            ((mmemq x visited) true)
            (else (begin (set! visited (mcons x visited))
                         (or (cycle?-helper (mcar x))
                             (cycle?-helper (mcdr x)))))))
    (cycle?-helper x)))

