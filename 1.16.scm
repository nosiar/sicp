(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (sqr (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

(define (fast-expt-iter b n)
  (define (fast-expt-iter-sub b n r)
    (cond ((= n 0) r)
          ((even? n) (fast-expt-iter-sub (sqr b) (/ n 2) r))
          (else (fast-expt-iter-sub b (- n 1) (* r b)))))
  (fast-expt-iter-sub b n 1))

(define (test n)
  (cond ((= n 0) #t)
        ((= (fast-expt 2 n) (fast-expt-iter 2 n)) (test (- n 1)))
        (else #f)))

(test 10000)
