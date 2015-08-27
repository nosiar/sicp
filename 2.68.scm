(load "2.67.scm")

(define (in? x l)
  (not (null? (filter (lambda (a) (eq? a x)) l))))

(define (encode-symbol symbol tree)
  (if (leaf? tree)
      '()
      (let ((left-symbols (symbols (left-branch tree)))
            (right-symbols (symbols (right-branch tree))))
        (cond ((in? symbol left-symbols)
               (cons 0 (encode-symbol symbol (left-branch tree))))
              ((in? symbol right-symbols)
               (cons 1 (encode-symbol symbol (right-branch tree))))
              (else (error "error"))))))

(define (encode message tree)
  (if (null? message)
      '()
      (append (encode-symbol (car message) tree)
              (encode (cdr message) tree))))

(encode '(A D A B B C A) sample-tree)
(decode (encode '(A D A B B C A) sample-tree) sample-tree)
