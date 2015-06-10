(define (reverse-x sequence)
  (foldr (lambda (x y) (append y (list x))) null sequence))

(define (reverse-y sequence)
  (foldl (lambda (x y) (cons x y)) null sequence))
