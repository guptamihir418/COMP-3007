; MIHIR GUPTA 101172281
; Question 4


; A -> this procedure returns the exponent that is needed to display the number to scientific notation
; My logic: I used log base 10, if we take log base 10 for any number N the floor of this will
; return the required answer. But the main issue is the default log is log base e, so I had to
; to convert that log base e value to log base 10, which I did by multiplying the answer by log base10 e = 0.434525.


(define (sci-exponent N)
  (inexact->exact(floor
                  (* 0.43425 (log N))))) ; log base10 e = 0.434525

; Testing Cases          ; LEFT SHIFTS ARE +VE AND RIGHT SHFTS ARE -VE
(display "Test cases for part A\n\n")


(display "(sci-exponent 12345): ")
(sci-exponent 12345) ; N = 12345, we need 1.2345, the number of LEFT shifts we need is +4,
                      ; which should be the answer

(display "(sci-exponent 0.00012345): ")
(sci-exponent 0.00012345) ; N = 0.00012345, we need 1.2345, the number of RIGHT shifts we need is -4,
                      ; which should be the answer

(display "(sci-exponent 1.2345): ")
(sci-exponent 1.2345) ; N = 1.2345, we need 1.2345, the number of RIGHT\LEFT shifts we need is 0,
                      ; which should be the answer

(newline)


; B -> This procedure returns the coefficient that should be used to display that number in scientific notation
; My logic: We take the exponent needed and divide the number by 10^exponent

(define (sci-coefficient N) (exact->inexact
                             (/ N (expt 10 (sci-exponent N)))))


; Testing Cases
(display "Test cases for part B\n\n")

(display "(sci-coefficient 12345): ")
(sci-coefficient 12345)           ; exponent -> 4 -> 12345/10000 -> 1.2345


(display "(sci-coefficient 0.00012345): ")
(sci-coefficient 0.00012345) ; exponent -> -4 -> 0.00012345/10^-4 -> 1.2345

(display "(sci-coefficient 1.2345): ")
(sci-coefficient 1.2345) ; exponent -> 0 -> 1.2345/10^0 -> 1.2345

(newline)


; C -> this procedure converts a number to string and represent the scientific notation of the number N

; My logic: First check if the N is number, if not return #f, else print the notation

(define (sci-num N)
  (if (number? N) ;check for number
      (string-append
       (number->string (sci-coefficient N))
       "x10^"
       (number->string (sci-exponent N))) #f))

; Testing Cases
(display "Test cases for part C\n\n")


(display "(sci-num 12345): ")
(sci-num 12345)           ; exponent -> 4 -> 12345/10000 -> 1.2345  -> 1.2345x10^4

(display "(sci-num 0.00012345): ")
(sci-num 0.00012345) ; exponent -> -4 -> 0.00012345/10^-4 -> 1.2345  -> 1.2345x10^-4

(display "sci-num 1.2345): ")
(sci-num 1.2345) ; exponent -> 0 -> 1.2345/10^0 -> 1.2345 -> 1.2345x10^0

(display "sci-num 'mihir'): ")
(sci-num "mihir") ; "mihir" is not a number, it is a string -> #f is returned