(define (f-re n)
  (if (< n 3)
      n
      (+ (f-re (- n 1)) (* 2 (f-re (- n 2))) (* 3 (f-re (- n 3))))))

(define (f-it n)
  (define (f-it-sub n a b c)
    (cond ((< n 2) n)
          ((= n 2) a)
          (else (f-it-sub (- n 1) (+ a (* 2 b) (* 3 c)) a b))))
  (f-it-sub n 2 1 0))

(define (test n) (= (f-re n) (f-it n)))

(displayln (test 1))
(displayln (test 2))
(displayln (test 3))
(displayln (test 4))
(displayln (test 5))
(displayln (test 6))
(displayln (test 7))
