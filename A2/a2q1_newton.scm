; MIHIR GUPTA
; 101172281

; A ->Newton's method for cube roots

(define (cbrt x) ; gives the cube of the number
  (define (cube y) (* y y y)) 

  (define (is-good guess) ; checks if the guess is good
    (< (abs (- (cube guess) x)) 0.0000001))

  (define (average x y) ; returns the avg value
    (/ (+ x y) 3))

  (define (improve guess) ; improves the guess by calling average
    (average (* 2 guess) (/ x (* guess guess))))

 (define (cbrt-iteration guess) ; iterator functions
    (if (is-good guess)
        guess
        (cbrt-iteration (improve guess))))
  
  (cbrt-iteration 2.0))

; Testing cases
(display "Testing cases for part A\n\n")

(display "(cbrt 27) => ")
(cbrt 27)

(display "(cbrt -125) => ")
(cbrt -125)

(display "(cbrt (/ 1 1000)) => ")
(cbrt (/ 1 1000))

(display "(cbrt 0) => ")
(cbrt 0)

(newline)



; B


#| (define (cbrt x)
  (define (cube y) (* y y y))

  (define (is-good guess)
    (< (abs (- (cube guess) x)) 0.0000001))

  (define (average x y)
    (/ (+ x y) 3))

  (define (improve guess)
    (average (* 2 guess) (/ x (* guess guess))))

  (define (new-if predicate consequent alternate)
    (cond (predicate consequent)
          (else alternate)))

 (define (cbrt-iteration guess)
    (new-if is-good guess (cbrt-iteration (improve guess))))
  
  (cbrt-iteration 2.0))

(cbrt 27) |#


; EXPLANATION

; The new-if is breaking becasue new-if is a function and scheme will use applicative order
; to evaluate, so it will try to evaluate all the things inside the function which means
; it will do that recurssive call and will goes to infinite recursion, so it never gets to
; apply predicate.
