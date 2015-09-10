(define random-init 42)
(define (rand-update x) (remainder (+ (expt x 18) (expt x 11) 1) 987654321))
(define rand
  (let ((x random-init))
    (lambda (arg)
      (cond ((eq? arg 'generate)
             (begin (set! x (rand-update x))
                    x))
            ((eq? arg 'reset)
             (lambda (value) (set! x value) x))
            (else "error")))))

