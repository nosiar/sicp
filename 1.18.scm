(define (double a) (+ a a))
(define (halve a) (/ a 2))

(define (fast-mult a b)
  (define (fast-mult-iter a b r)
    (cond ((= b 0) r)
          ((even? b) (fast-mult-iter (double a) (halve b) r))
          (else (fast-mult-iter a (- b 1) (+ r a)))))
  (fast-mult-iter a b 0))

(fast-mult 9 13)
