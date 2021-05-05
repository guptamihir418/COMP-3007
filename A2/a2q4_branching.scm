; MIHIR GUPTA
; 101172281

; A -> recurrsive process

(define (f n)
  (if (< n 3)  ; base step
      n
      ; recurssive step
      (+ (* 3 (f (- n 1)))
         (* 2 (f (- n 2)))
         (f (- n 3)))))

; Testing cases
(display "Testing cases for part A\n\n")

(display "(f 7) => ")
(f 7)

(display "(f 6) => ")
(f 6)

(display "(f 5) => ")
(f 5)

(display "(f 4) => ")
(f 4)

(display "(f 3) => ")
(f 3)

(display "(f 2) => ")
(f 3)

(display "(f 1) => ")
(f 1)

(display "(f 0) => ")
(f 0)

(newline)


; Substitution model for recurssive process -> Doing for (f 4)

; (f 5)     -> it is greater than 3 will pick else part
; (+ (* 3 (f (- 5 1))) (* 2 (f (- 5 2))) (f (- 5 3)))
; (+ (* 3 (f 4)) (* 2 (f 3)) (f 2))

#| (+ (* 3 (+ (* 3 (f (- 4 1))) (* 2 (f (- 4 2))) (f (- 4 3))))
    (* 2 (+ (* 3 (f (- 3 1))) (* 2 (f (- 3 2))) (f (- 3 3))))
    2) |#


#| (+ (* 3 (+ (* 3 (f 3)) (* 2 (f 2)) (f 1)))
    (* 2 (+ (* 3 (f 2)) (* 2 (f 1)) (f 0)))
    2)   |#

#| (+ (* 3 (+ (* 3 (+ (* 3 (f (- 3 1)))
                   (* 2 (f (- 3 2)))
                   (f (- 3 3))))
           4
           1))
    (* 2 (+ (* 3 2) (* 2 1) 0))
    2)    |#

#| (+ (* 3 (+ (* 3 (+ (* 3 (f 2))
                   (* 2 (f 1))
                   (f 0)))
           4
           1))
    (* 2 (+ 6 2 0))
    2)    |#

#| (+ (* 3 (+ (* 3 (+ (* 3 2) (* 2 1) 0))
           4
           1))
    (* 2 8)
    2)   |#

; (+ (* 3 (+ (* 3 (+ 6 2 0)) 4 1)) (* 2 8) 2)
; (+ (* 3 (+ (* 3 8) 4 1)) 16 2)
; (+ (* 3 (+ 24 4 1)) 16 2)
; (+ (* 3 29) 16 2)
; (+ 87 16 2)
; 105




; B -> Iterative Process

(define (f2 n)
  ; helper
  (define (f2-iteration count n1 n2 n3)
    ; if count increases "n" it should return last calculated value
    (if (> count n)
        n1
        ; else increase count and calculate f(n1+1) and forget n3
        (f2-iteration (+ count 1) (+ (* 3 n1) (* 2 n2) n3)  n1 n2)))
  (if (<= (- n 1) 0) n (f2-iteration 3 2 1 0)))


; Testing cases
(display "Testing cases for part B\n\n")

(display "(f2 7) => ")
(f2 7)

(display "(f2 6) => ")
(f2 6)

(display "(f2 5) => ")
(f2 5)

(display "(f2 4) => ")
(f2 4)

(display "(f2 3) => ")
(f2 3)

(display "(f2 2) => ")
(f2 3)

(display "(f2 1) => ")
(f2 1)

(display "(f2 0) => ")
(f2 0)

(newline)

; Substitution Model -> iterative process

; (f2 5)
; (f2-iteration 3 2 1 0)  -> count = 3, n1 = 2, n2 = 1, n3 = 0
; (f2-iteration (+ 3 1) (+ (* 3 2) (* 2 1) 0)  2 1)
; (f2-iteration 4 (+ 6 2 0) 2 1)
; (f2-iteration 4 8 2 1)
; (f2-iteration (+ 4 1) (+ (* 3 8) (* 2 2) 1) 8 2)
; (f2-iteration 5 (+ 24 4 1) 8 2)
; (f2-iteration 5 29 8 2)
; (f2-iteration (+ 5 1) (+ (* 3 29) (* 2 8) 2)  29 8)
; (f2-iteration 6 (+ 87 16 2)  29 8)
; (f2-iteration 6 105  29 8)
; 105          -> as counter is now greater than n=5, so should return n1


