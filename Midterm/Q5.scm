; Mihir Gupta
; 101172281

(define (sum-seq n)
  (define (sum-seq-iter n)
    (cond ((= n 0) 0)
          ((= 0 (modulo n 2)) (+ 2 (sum-seq-iter (- n 1))))
          (else (+ 3 (sum-seq-iter (- n 1))))))
  (sum-seq-iter n))

