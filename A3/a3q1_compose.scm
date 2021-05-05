; Mihir Gupta
; 101172281

;1  

(define (compose f g)
  (lambda (x) (f (g x))))

(define square (lambda(x) (* x x)))
(define double (lambda(x) (+ x x)))
; Testing cases for part A

(display "Tesing for Part A\n\n")

(display "((compose square double) 3) -> ")
((compose square double) 3)

(display "(( compose double square) 3) -> ")
(( compose double square) 3)
(newline)


;2

(define (divisibleBy x)
  (lambda (y) (if (= (modulo y x) 0)
                  #t
                  #f)))

; Testing cases for part B

(display "Tesing for Part B\n\n")

(define mod3 (divisibleBy 3))
(display "(mod3 7) ->     ")
(mod3 7)
(display "(mod3 9) ->     ")
(mod3 9)

(define mod4 (divisibleBy 4))
(display "(mod4 8) ->     ")
(mod4 8)

(display "(mod4 111) ->   ")
(mod4 111)
(newline)

;3

(define (newmap f)
  (define (helper L)
    (if (null? L) '()
        (cons (f (car L))
              (helper (cdr L)))))
  helper)

(define double-mapper (newmap (lambda (x) (* x 2))))
(define ten-folds (newmap (lambda (x) (* x 10))))

; Testing cases for part C

(display "Tesing for Part C\n\n")

(display "(double-mapper '(1 2 3 4)) ->     ")
(double-mapper '(1 2 3 4))
(display "(double-mapper '(10 20 30)) ->    ")
(double-mapper '(10 20 30))

(display "(ten-folds '(2 3 40)) ->          ")
(ten-folds '(2 3 40 ))
(newline)


;4


(define (newfilter f)
  (define (helper L)
    (cond ((null? L) '())
          ((f (car L)) (cons (car L)
                             (helper (cdr L))))
          (else (helper (cdr L)))))
  helper)
          

(define evens-filter (newfilter (divisibleBy 2)))

; Testing cases for part C

(display "Tesing for Part D\n\n")

(display "(evens-filter '(1 2 3 4 5 6 7 8 10 11 13 15 16)) ->     ")
(evens-filter '(1 2 3 4 5 6 7 8 10 11 13 15 16))
(display "(evens-filter '(1 1 1 1 3 3 3 3)) ->                    ")
(evens-filter '(1 1 1 1 3 3 3 3))
(newline)

;5

(define (range a b)
  (if (> a b) '()
      (cons a (range (+ a 1) b))))
      

(define (myfunc L)
  
  (define four-filter (newfilter (divisibleBy 4)))
  (define sq-mapper (newmap square))
  (sq-mapper (four-filter L)))

; Testing cases for part C


;(myfunc (range 1 20)) -> (16 64 144 256 400)

(display "Expected result for Part D\n\n")

(display "(myfunc (range 1 20)) ->     ")
(myfunc (range 1 20))



  