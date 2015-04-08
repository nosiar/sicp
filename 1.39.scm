(define (cont-frac n d k)
  (define (cont-frac-sub curk)
    (if (= curk k)
        (/ (n curk) (d curk))
        (/ (n curk) (+ (d curk) (cont-frac-sub (+ curk 1))))))
  (cont-frac-sub 1))

(define (tan-cf x k)
  (cont-frac (lambda (i) (if (= i 1) x (- (sqr x))))
             (lambda (i) (- (* 2 i) 1))
             k))

(tan-cf (/ pi 4) 1000)
