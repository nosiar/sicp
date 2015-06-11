(define (enumerate-interval low high)
  (if (> low high)
      null
      (cons low (enumerate-interval (add1 low) high))))

(define (flatmap proc seq)
  (foldr append null (map proc seq)))

(define (unique-pairs n)
  (flatmap (lambda (i) (map (lambda (j) (list i j)) (enumerate-interval 1 (sub1 i))))
           (enumerate-interval 1 n)))

