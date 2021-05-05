(define (bits n)
  (if (<= n 1)
      1
      (+ 1 (bits (quotient n 2)))))


(bits 9)
(bits 99)

(define (bits-itr n)
  (define (iterator add count)
    (if (> count (quotient n 2))
        add
        (iterator (+ add 1) (+ count 1))))
  (iterator 0 0))

(bits-itr 9)
(bits-itr 99)

