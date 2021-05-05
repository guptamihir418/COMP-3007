; MIHIR GUPTA 101172281
; Question 2


; This question contains the functions. Just a disclaimer :) means the expected output is correct
; when compared to the actual output and :( means its not.


 ;A -> Cube x procedure
; This procedure will calculate the cube of argument passed in.

(define (cube x) (* x x x))

; testing cases
(display "Testing cases for part A\n")

(display "cube 6: ")
(cube 6) ; Should yield (6 * 6 * 6)                                         -> 216       :)

(display "cube 31: ")
(cube 31) ; Should yield (31 * 31* 31)                                      -> 29791     :)

(display "cube 3.1: ")
(cube 3.1) ; should yield (31 * 31 * 31)/1000
                         ; -> 292144/1000 -> 29.791                 -> 29.791000000000004 :(

#| The expected value do not match with the actual output, Why?
 -> it is becasue floating point inaccuracy in the scheme, computations that involve an inexact
 number produces an inexact result. |#

(newline)


; B-> This procedure will calculate the value (3x^2 + 1)

(define (f x)
  (+ (* 3 x x) 1))

; Testing cases
(display "Testing cases for part B\n")

(display "f(6): ")
(f 6) ; -> (3 * 6 *6 ) + 1  -> 108 + 1 -> 109        :)

(display "f(0.6): ")
(f 0.6) ; -> (3 * 0.6 * 0.6) +1 -> 1.08 +1 -> 2.08   :)

(display "f(3): ")
(f 3) ; -> (3 * 3 * 3) + 1 -> 28                      :)

(display "f(12): ")
(f 12) ; -> (3 * 3 * 3) + 1 -> 28                     :)

(newline)


; C -> This procedure will calucluate the value f(2x) - 2x^3

(define (g x) (- (f (* 2 x))
                 (* 2 x x x)))

; Testing cases
(display "Testing cases for part C\n")

(display "g(3): ")
(g 3) ; -> f(2 * 3) - 2(3 * 3 * 3)
      ; -> f(6) - 2 * 27
      ; -> 109 - 54 -> 55                           :)

(display "g(6): ")
(g 6) ; -> f(2 * 6) - 2(6 * 6 * 6)
      ; -> f(12) - 2 * 216
      ; -> 433 - 432 -> 1                           :)

(display "g(0.3): ")
(g 0.3) ; -> f(2 * 0.3) - 2(0.3 * 0.3 * 0.3)
        ; -> f(0.6) - 2 * 0.027
        ; -> 2.08 - 0.054 -> 2.026                   :(  why? same reason floating point inaccuracy.
(newline)


; D -> This procedure will calculate the value of 3f(x/2) + (gx) 

(define (h x) (+
               (* 3 (f (/ x 2)))
               (g x)))
; Testing cases
(display "Testing cases for part D\n")

(display "h(6): ")
(h 6) ; -> 3f(6/2) + g(6)
      ; -> 3f(3) + 1 -> 3 * 28 + 1 -> 85             :)

(newline)


;E Substitution model using applicative order for (h (* 2 3))

; (h (* 2 3))
; (h 6)
; (+ (* 3 (f (/ 6 2))) (g 6))
; (+ (* 3 (f 3)) (g 6))
; (+ (* 3 (+ (* 3 3 3) 1)) (- (f (* 2 6)) (* 2 6 6 6)))
; (+ (* 3 (+ 27 1)) (- (f 12) 432))
; (+ (* 3 28) (- (+ (* 3 12 12) 1) 432))
; (+ 84 (- (+ 432 1) 432))
; (+ 84 (- 433 432))
; (+ 84 1)
; 85

; Testing case
(display "Testing cases for part E\n")

(display "(h (* 2 3)): ")
(h (* 2 3))

(newline)


;F Susbstitution model using normal order for (h (* 2 3))

; (h (* 2 3))
;(+ (* 3 (f (/ (* 2 3) 2))) (g (* 2 3)))
;(+ (* 3 (+ (* 3 (/ (* 2 3) 2) (/ (* 2 3) 2)) 1)) (g (* 2 3)))
; (+ (* 3 (+ (* 3 (/ 6 2) (/ (* 2 3) 2)) 1)) (g (* 2 3)))
; (+ (* 3 (+ (* 3 3 (/ (* 2 3) 2)) 1)) (g (* 2 3)))
; (+ (* 3 (+ (* 3 3 (/ 6 2)) 1)) (g (* 2 3)))
; (+ (* 3 (+ (* 3 3 3) 1)) (g (* 2 3)))
; (+ (* 3 (+ 27 1)) (g (* 2 3)))
; (+ (* 3 28) (g (* 2 3)))
; (+ 84 (g (* 2 3)))
; (+ 84 (- (f (* 2 (* 2 3))) (* 2 (* 2 3) (* 2 3) (* 2 3))))
; (+ 84 (- (+ (* 3 (* 2 (* 2 3)) (* 2 (* 2 3))) 1) (* 2 (* 2 3) (* 2 3) (* 2 3))))
; (+ 84 (- (+ (* 3 (* 2 6) (* 2 (* 2 3))) 1) (* 2 (* 2 3) (* 2 3) (* 2 3))))
; (+ 84 (- (+ (* 3 12 (* 2 (* 2 3))) 1) (* 2 (* 2 3) (* 2 3) (* 2 3))))
; (+ 84 (- (+ (* 3 12 (* 2 6)) 1) (* 2 (* 2 3) (* 2 3) (* 2 3))))
; (+ 84 (- (+ (* 3 12 12) 1) (* 2 (* 2 3) (* 2 3) (* 2 3))))
; (+ 84 (- (+ 432 1) (* 2 (* 2 3) (* 2 3) (* 2 3))))
; (+ 84 (- 433 (* 2 (* 2 3) (* 2 3) (* 2 3))))
; (+ 84 (- 433 (* 2 6 (* 2 3) (* 2 3))))
; (+ 84 (- 433 (* 2 6 6 (* 2 3))))
; (+ 84 (- 433 (* 2 6 6 6)))
; (+ 84 (- 433 432))
; (+ 84 1)
; 85


; Testing case
(display "Testing cases for part F\n")

(display "(h (* 2 3)): ")
(h (* 2 3))
