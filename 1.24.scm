(define (expmod base exp m)
; (printf "base:~a exp:~a m:~a~n" base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (sqr (expmod base (/ exp 2) m))
                    m))
        (else
          (remainder (* base (expmod base (- exp 1) m))
                     m))))

(define (fermat-test n)
  (define (try-it a)
;   (printf "a:~a n:~a exp:~a~n" a n (expmod a n n))
    (= (expmod a n n) a))
  (try-it (exact-round (* (random) n))))

(define (fast-prime? n times)
; (printf "fp n:~a times:~a~n" n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (report-prime n elapsed-time)
  (newline)
  (display n)
  (display " *** ")
  (display elapsed-time)
  elapsed-time)

(define (start-prime-test n start-time)
  (if (fast-prime? n 100)
      (report-prime n (- (current-inexact-milliseconds) start-time))
      0))

(define (timed-prime-test n)
  (start-prime-test n (current-inexact-milliseconds)))

(define (search-for-primes n count)
  (define (search-for-primes-sub n curcount r prevr)
;   (printf "sfps n:~a curcount:~a r:~a prevr:~a~n" n curcount r prevr)
    (cond ((= curcount 0) (/ r count))
          ((not (= r prevr)) (search-for-primes-sub n (- curcount 1) r r))
          ((even? n) (search-for-primes-sub (+ n 1) curcount r r))
          (else (search-for-primes-sub (+ n 2) curcount (+ r (timed-prime-test n)) r))))
  (define (print-result avg)
    (newline)
    (display n)
    (display " average *** ")
    (display avg))
  (print-result (search-for-primes-sub n count 0 0)))

;(search-for-primes 1000 3)
;(search-for-primes 10000 3)
;(search-for-primes 100000 3)
;(search-for-primes 1000000 3)
(search-for-primes 100000000000 3)
(search-for-primes 10000000000000000000000 3)
(search-for-primes 100000000000000000000000000000000000000000000 3)