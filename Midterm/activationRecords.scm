; Activation records

; Static link point to where the function was defined
; Dynamic links point to from which the  current function is caslled

(define (one x)
  (define (two y z)
    (four (+ x (* 2 y) (* 3 z))))
  (define (three)
    (two (+ x 1) (* x 2)))
  (define (four u)
    (+ u 2))
  (three))

(one 5)

; Static links

; one -> global
; two -> one
; three -> one
; four -> one


(define (one x)
      (define (two y z)
            (+ x (* 2 y) (* 3 z)))
      (define (three w)
             (four (* x w)))
      (define (four u)
             (+ u 2))
      (if (> x 10) (three (two (+ x 1)(* x 2)))
                       (two (three (* x 12)) x)))

