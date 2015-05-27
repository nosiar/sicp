(define (same-parity . l)
  (define (iter l)
    (cond ((null? (cdr l)) l)
          ((eq? (even? (car l)) (even? (cadr l))) (cons (car l) (iter (cdr l))))
          (else (iter (cons (car l) (cddr l))))))
  (iter l))