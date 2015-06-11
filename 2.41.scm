(load "2.40.scm")

(define (unique-triple n)
  (filter (lambda (x) (and (not (= (car x) (cadr x)))
                           (not (= (car x) (caddr x)))
                           (not (= (cadr x) (caddr x)))))
          (flatmap (lambda (i)
                     (flatmap (lambda (j)
                                (map (lambda (k) (list i j k))
                                     (enumerate-interval 1 n)))
                              (enumerate-interval 1 n)))
                   (enumerate-interval 1 n))))

(define (triple-sum-s n s)
  (filter (lambda (x) (= s (foldr + 0 x)))
          (unique-triple n)))

(triple-sum-s 6 6)
