(define (repeated f n)
  (if (= n 0)
      identity
      (lambda (x) ((repeated f (- n 1)) (f x)))))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated2 f n)
  (if (= n 0)
      identity
      (compose (repeated2 f (- n 1)) f)))

((repeated sqr 2) 5)
((repeated2 sqr 2) 5)
