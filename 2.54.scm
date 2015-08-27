(define (my-equal? a b)
  (cond ((and (symbol? a) (symbol? b) (eq? a b)) #t)
        ((and (null? a) (null? b)) #t)
        ((and (list? a) (list? b)) (and (equal? (car a) (car b))
                                        (equal? (cdr a) (cdr b))))
        (else #f)))

