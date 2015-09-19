(require scheme/mpair)

(define (mlast-pair x)
  (if (null? (mcdr x))
      x
      (mlast-pair (mcdr x))))

(define (make-cycle x)
  (set-mcdr! (mlast-pair x) x)
  x)

(define (cycle? x)
  (let ((mynull 'asdfasdfasdfasdf))
    (cond ((eq? mynull x) true)
          ((not (mpair? x)) false)
          (else
            (let ((temp1 (mcar x))
                  (temp2 (mcdr x)))
              (set-mcar! x mynull)
              (set-mcdr! x mynull)
              (let ((ret (or (cycle? temp1)
                             (cycle? temp2))))
                (set-mcar! x temp1)
                (set-mcdr! x temp2)
                ret))))))

