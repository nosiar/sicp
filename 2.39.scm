(define (reverse-x sequence)
  (foldr (lambda (x y) (append y (list x))) null sequence))

(define (reverse-y sequence)
  (foldl cons null sequence))

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

(define (reverse-z sequence)
  (fold-left (lambda (x y) (cons y x)) null sequence))

