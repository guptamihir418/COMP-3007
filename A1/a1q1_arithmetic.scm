; MIHIR GUPTA 101172281
; Question 1


; This question contains simple airthmetic problems, which is converted to scheme code.

;A -> 1 + -2 - 3 + 4 + -5 - 6 + 7                                -> -4

(display "Part A value: ")

(+ (- (+ 1 -2) 3)
   (- (+ 4 -5) 6) 7)

(newline)

;B -> 20 - 1 + ((26/2 + 2) * (20/5 - 2))                          -> 49

(display "Part B value: ")

(+ 20 -1
   (* (+ (/ 26 2) 2)
      (- (/ 20 5) 2)))

(newline)


;C -> (36/9 * (12/4 - 14 / (13+2)) +12) /4                        -> 76/15

(display "Part C value: ")

(/ (+ (* (/ 36 9)
         (+ (- (/ 12 4)
               (/ 14 (+ 13 2)))))
      12) 4)

(newline)

;D -> ( (50*20) * 2) + ((17/4) + 3.85) + ((30*2) - 48) + 1         -> 2021.1

(display "Part D value: ")

(+ (+
    (* (* 50 20) 2)
    (+ (/ 17 4) 3.85)
    (- (* 30 2) 48))
   1)