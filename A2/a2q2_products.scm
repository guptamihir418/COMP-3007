; MIHIR GUPTA
; 101172281

; A

; This is my normal recursive function to calculate product of two numbers

;(define (product x y)
  ;(if (< y 1)
    ;  0
      ;(+ x (product x (- y 1)))))

; this is my higher order procedure for the product

(define (product a b term next)
    (if (> a b)
    1
    (* (term a) 
       (product (next a) b term next))))

; these are the helper procedures which are passed inside the higher order product procedure
(define (identity) (lambda (x) x))
(define (next) (lambda (x) (+ x 1)))

; Testing cases

(display "Testing cases for part A\n\n")

(display "(product 1 5 identity next): ")
(product 1 5 (identity) (next)) ;-> should return 80

(display "(product 0 8 identity next): ")
(product 0 8 (identity) (next))  ;-> should return 0

(newline)

; B

; This is my normal iterative code
(define (product-it a b term next)
  (define (iterator A B T N)
    (cond
      ((<= A B) (* (T A) (iterator (N A) B T N)))
      (else  1)))
  (iterator a b term next))


; Testing cases

(display "Testing cases for part B\n\n")

(display "(product-it 1 5 identity next): ")
(product-it 1 5 (identity) (next)) ;-> should return 80

(display "(product-it 0 8 identity next): ")
(product-it 0 8 (identity) (next))  ;-> should return 0

(newline)


; C
(define (get_cube_minus_square) (lambda (x) (- (* x x x) (* x x))))
(define (get_2k_plus_1_square) (lambda (x) (* (+ (* 2 x) 1) (+ (* 2 x) 1))))

(display "Testing cases for part C\n\n")

;(a)
(display "(product 2 20 (get_cube_minus_square) (next)): ")
(product 2 20 (get_cube_minus_square) (next))
(newline)

;(b)
(display "(product 1 15 (get_2k_plus_1_square) (next)): ")
(product 1 15 (get_2k_plus_1_square) (next))
(newline)

;(c)
(display "(product 1 5 (lambda (a) (product a 6 (lambda (b) (* 3 (* a (* b b)))) (next))) (next)): ")
(product 1 5 (lambda (a) (product a 6 (lambda (b) (* 3 (* a (* b b)))) (next))) (next))


  
  
