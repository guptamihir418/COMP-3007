; MIHIR GUPTA
; 101172281

(define (hyperUtil A B Current Operator)
  (cond
    ((not (zero? (- Current 1)))
     (Operator A (hyperUtil A B (- Current 1) Operator)))
    (else A)))

(define (hyper Operator)
  (lambda (x y) (hyperUtil x y y Operator)))


; Testing cases
(display "Testing cases \n\n")

(display "(define my-mult (hyper +))
(my-mult 3 4)  => ")

(define my-mult (hyper +))
(my-mult 3 4)
(newline)

(display "(define my-exp (hyper my-mult))
(my-exp 2 4)  => ")

(define my-exp (hyper my-mult))
(my-exp 2 4)
(newline)

(display "(define my-tetra (hyper my-exp))
(my-tetra 2 4)  => ")
(define my-tetra (hyper my-exp))
(my-tetra 2 4)
