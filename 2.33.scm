(define (map-x p sequence)
  (foldr (lambda (x y) (cons (p x) y)) null sequence))

(define (append-x seq1 seq2)
  (foldr cons seq2 seq1))

(define (length-x sequence)
  (foldr (lambda (x y) (+ y 1)) 0 sequence))
