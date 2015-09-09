(define (make-monitored f)
  (let ((count 0))
    (lambda (head . rest)
      (cond ((eq? head 'how-many-calls?) count)
            ((eq? head 'reset-count) (set! count 0))
            (else (begin (set! count (add1 count))
                         (apply f (cons head rest))))))))

