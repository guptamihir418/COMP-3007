; MIHIR GUPTA 101172281
; Question 3


; Part A-> Standard Round-off

; It takes an input number (A) and precision value (B) as parameters and returns the input
; number rounded to the specified precision value

; My logic -> if we multiply the input number i.e. A with 10^B ( where B is precision value)
; we will get a value which we can round off easily by adding or subtracting 0.5 to the specified decimal digits.

(define (standard-roundf A B)
  (let ((pow (expt 10 B)))
    (/ (floor (+ 0.5 (* A pow)))
       pow)))

; Testing cases
(display "Testing cases for part A\n\n")

(display "(standard-roundf 2.5 0): ")
(standard-roundf 2.5 0)    ; Precision needed is 0 decimal point, the answer should be 2.5 + 0.5 -> 3.0
                           ; 3.0 Correct

(display "(standard-roundf 1.2225 3): ")
(standard-roundf 1.2225 3) ; Precision should be 3, so multiply 1.2225 by 10^3 = 1000
                           ; 1222.5 now add 0.5 -> 12223 now divide it by same value 10^3 = 1000
                           ; 1.223 Correct 

(display "(standard-roundf -1.82593 2): ") 
(standard-roundf -1.82593 2)  ; Precision should be 2, so multiply -1.82593 by 10^2 = 100
                              ; -182.593 now subtract 0.5 -> -182.093 now we take floor of this number
                              ; -183 -> now divide by 100 -> -1.83 Correct

(display "(standard-roundf 186 1): ") 
(standard-roundf 186 1)   ; Precision should be 1, so multiply 186 by 10 -> 1860 now we take floor
                          ; of this number and we get 1860 -> now divide by 10 -> 186.0 Correct

(newline)
  

; Part B -> Quadratic Equation

; This is the quadratic formula which calculates the roots of equation of form ax^2 + bx + c = 0
; it returns #f if roots are not real or we can say that when term inside underoot is -ve which is
; -b^2 + 4ac and will also return false if a = 0

; My algorithm: I first check if value of a is zero or not, if it is procedure is called off without
; actually running any code, it is efficient and next if condition checks if the term inside the square root
; is =ve if not it will return #f and at last I use standard-roundf to round off the answer to 3 DP

(define (quadratic a b c)
  (if (= a 0)
      #f
      (if (< (- (* b b) (* 4 a c)) 0)
          #f
          (standard-roundf (/ (+ (sqrt (- (* b b) (* 4 a c)))
                                 (* -1 b)) (* 2 a)) 3))))

; Testing cases
(display "Testing cases for part B\n\n")


(display "(quadratic 5 12 1)=> ")
(display "A = 5 B = 12 C = 1 Discriminant = 124\n ")
(display "Root: ")
(quadratic 5 12 1) ; A = 5 B = 12 C = 1 -> A != 0 -> b^2 - 4ac = 144 - 20 = 124 which is positive
                   ; and every condition is met it will return the root of th eequation 4x^2 + 12x + 1 =0
(newline)

(display "(quadratic 0 12 1)=> ")
(display "A = 0 B = 12 C = 1 Discriminant = 144\n ")
(display "Root: ")
(quadratic 0 12 1) ; A = 0 and hence program quits after checking first conditon

(display "(quadratic 5 1 1)=> ")
(display "A = 5 B = 1 C = 1 Discriminant = -19\n ")
(display "Root: ")
(quadratic 5 1 1) ; As Discriminant is -ve we get #f returned

(newline)

; Part C -> This procedure converts any combination of Bytes "B", kibibytes "kiB" and Kilobytes  "KB"

; My logic: Used cond to get all the cases, but how many cases to caluclate that I used PNC
; I have 3 option and I need to choose any 2 of them 3C2 = 6
; Also what if we convert from and to one thing only those cases = 3
; Total cases = 6+3 = 9, if there is any other case other than these 9 cases
; We give error message

(define (convert N A B) ; N is the number we want to convert, A is the "from unit", B is "to unit"
(cond ((and (equal? A "KB") (equal? B "B")) (* 1000 N))
((and (equal? A "KB") (equal? B "KiB")) (* 0.9765625 N))
((and (equal? A "KiB") (equal? B "B")) (* 1024 N))
((and (equal? A "KiB") (equal? B "KB")) (* 1.024 N))
((and (equal? A "B") (equal? B "KB")) (standard-roundf (/ N 1000) 3))
((and (equal? A "B") (equal? B "KiB")) (standard-roundf (/ N 1024) 3))
((and (equal? A "B") (equal? B "B")) N) ; Same unit conversions
((and (equal? A "KiB") (equal? B "KiB")) N) ; Same unit conversions
((and (equal? A "KB") (equal? B "KB")) N) ; Same unit conversions
(else (string-append  "Could not convert from " A " to " B))))

; Testing cases
(display "Testing cases for part C\n\n")

(display "(convert 42 KB B ): ")
(convert 42 "KB" "B"); conversion from kilo bytes to bytes we multiply 42 by 1000 -> 42000

(display "(convert 42 KiB B ): ")
(convert 42 "KiB" "B"); conversion from kibibytes to bytes we multiply 42 by 1024 -> 43008

(display "(convert 42 KiB KB ): ")
(convert 42 "KiB" "KB"); conversion from kibibytes to bytes we multiply 42 by 1.024 -> 43.008

(display "(convert 42 KiB KiB ): ")
(convert 42 "KiB" "KiB"); conversion from kibibytes to kibibytes, same units return same number -> 42


