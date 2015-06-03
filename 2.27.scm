(define x (list (list 1 2) (list 3 4)))
(define y (list (list (list 1 2) (list 3 4) 5) (list (list 6 7) (list (list (list 8 9) 10) 11))))

(define (deep-reverse l)
  (if (or (null? l) (not (pair? l)))
      l
      (append (deep-reverse (cdr l))
              (list (deep-reverse (car l))))))
x
(reverse x)
(deep-reverse x)
y
(reverse y)
(deep-reverse y)
