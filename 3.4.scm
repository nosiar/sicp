(define (make-account balance password)
  (define fail 0)
  (define (call-the-cops) "?!?!")
  (define (withdraw amount)
    (if (>= balance amount)
      (begin (set! balance (- balance amount))
             balance)
      "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (dispatch p m)
    (if (not (eq? p password))
        (lambda (x) (begin (set! fail (add1 fail))
                           (if (= fail 8)
                               (call-the-cops)
                               "Incorrect password")))
        (begin (set! fail 0)
               (cond ((eq? m 'withdraw) withdraw)
                     ((eq? m 'deposit) deposit)
                     (else (error "Unknown request -- MAKE-ACCOUNT"
                                  m))))))
  dispatch)

