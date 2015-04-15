(define (simpson f a b n)
  (define (coef k)
    (cond ((or (= k 0) (= k n)) 1)
          ((= (remainder k 2) 1) 4)
          (else 2)))
  (define (simpson-sub k)
    (if (> k n)
        0
        (+ (* (coef k) (f (+ a (* k (/ (- b a) n))))) (simpson-sub (+ k 1)))))
  (* (/ (/ (- b a) n) 3) (simpson-sub 0)))

(define (cube x) (* x x x))

(simpson cube 0.0 1.0 100)
(simpson cube 0.0 1.0 1000)
