(define (pascal n c)
  (if (or (= c 0) (= n c))
      1
      (+ (pascal (- n 1) c) (pascal (- n 1) (- c 1)))))

(define (print-pascal)
  (define (print-pascal-iter size n c)
    (printf "~a " (pascal n c))
    (if (< c n)
        (print-pascal-iter size n (+ c 1))
        (if (< n size)
            (begin (printf "~n") (print-pascal-iter size (+ n 1) 0))
            (void))))
  (print-pascal-iter 6 0 0))

(print-pascal)
