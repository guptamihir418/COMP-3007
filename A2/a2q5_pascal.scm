; MIHIR GUPTA
; 101172281

; A -> Recursive Process


(define (pascals r c)
  (cond ((or (= c 0) (= c r)) 1)  ; returns the last and first value in each row as it is always 1
        ((> c r) 0)  ; if number of cols > rows, measn col doesnt exist return 0
        (else (+ (pascals (- r 1) c)
                 (pascals (- r 1) (- c 1)))))) ; calculate above two's sum

; Testing cases A
(display "Testing cases for part A\n\n")

(display "(pascals 0 0) => ")
(pascals 0 0)

(display "(pascals 2 0) => ")
(pascals 2 0)

(display "(pascals 2 1) => ")
(pascals 2 1)

(display "(pascals 4 2) => ")
(pascals 4 2)

(display "(pascals 7 4) => ")
(pascals 7 4)
(newline)
(newline)

; B -> Printing pascal's triangle

; Helper functions
(define (printUtility A B) ; This is for inner for loop (A is I and B is J)
  (if (zero? (- A B))
      (number->string (pascals A A))
      (string-append (number->string (pascals A B)) " " (printUtility A (+ B 1)))))

(define (printTriangleHelp N) ;; This is for outer for loop (N is I)
  (if (zero? n)
      (number->string (pascals 0 0))
      (string-append (printTriangleHelp (- N 1)) "\n" (printUtility N 0))))

;; Main function
(define (printTriangle NUMBER) (display (printTriangleHelp (- NUMBER 1))))


; Testing cases B
(display "Testing cases for part B\n\n")

(display "(printTriangle 5): ")
(newline)
(newline)

(printTriangle 5)

(newline)
(newline)

(display "(printTriangle 7): ")
(newline)
(newline)

(printTriangle 7)



