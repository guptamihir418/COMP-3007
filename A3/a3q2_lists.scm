; Mihir Gupta
; 101172281

;1

(define (repeat x n)
  (if (< n 1) '()
      (cons x (repeat x (- n 1)))))

; Testing cases for part A

(display "Tesing for Part A\n\n")

(display "(repeat 'a 5) ->      ")
(repeat 'a 5)
(display "(repeat 'abb 10) ->   ")
(repeat 'abb 10)
(newline)

;2

(define (alternate list1 list2)
  (cond ((null? list1) list2)
        ((null? list2) list1)
        (else (cons (car list1)
                    (cons (car list2)
                          (alternate (cdr list1) (cdr list2)))))))

; Testing cases for part B

(display "Tesing for Part B\n\n")

(display "(alternate '(0 0 0 0) '(1 1 1 1 1 1)) ->      ")
(alternate '(0 0 0 0) '(1 1 1 1 1 1))
(display "(alternate '(a a a a) '(b b b b)) ->          ")
(alternate '(a a a a) '(b b b b))
(newline)


;3

(define (count x L)
  (cond ((null? L) 0)
        ((equal? (car L) x) (+ 1 (count x (cdr L))))
        (else (count x (cdr L)))))

;Testing for part C

(display "Tesing for Part C\n\n")

(display "(count 3 '(1 4 3 6 2 3 3 1 4 3 5 7)) ->      ")
(count 3 '(1 4 3 6 2 3 3 1 4 3 5 7))

(display "(count 'b '(4 b a 3 2 c b 1 b d a)) ->       ")
(count 'b '(4 b a 3 2 c b 1 b d a))

(newline)



;4


(define (mode L)
  (define (helper1 A B x Final)
    (cond ((null? A) Final) ; return the last stored val
          ((<= (car B) x) (helper1 (cdr A) (cdr B) x Final))
          (else (helper1 (cdr A) (cdr B) (car B) (car A)) )))
  
  (define (helper2 A B)
    (if (= 0 (length A)) (list )
        (cons (count (car A) B) (helper2 (cdr A) B))))
  
  (helper1 L (helper2 L L) 0 0))

;Testing for part D

(display "Tesing for Part D\n\n")

(display "(mode '(a b b c a c c c c c b b)) ->      ")
(mode '(a b b c a c c c c c b b))

(display "(mode '(a b a c a d d a b c a b)) ->      ")
(mode '(a b a c a d d a b c a b))

(display "(mode '(2 b a 3 2 c b 1 2 d a)) ->        ")
(mode '(2 b a 3 2 c b 1 2 d a))

(newline)

;5


(define (decreasing L)
  (define (helper1_decreasing X L)
    (cond ((eq? (length L) 0) '())
          ((< (car L) X) (cons (car L) (helper1_decreasing (car L) (cdr L))))
          (else (helper1_decreasing X (list )))))

  (define (helper2_decreasing L)
    (cond ((= (length L) 0) '())
          ((<= (length (car L)) 1) (helper2_decreasing (cdr L)) )
          (else (cons (car L) (helper2_decreasing (cdr L)) ))))

  (define (helper3_decreasing L)
    (cond ((eq? 0 (length L)) '())
          (else (cons (helper1_decreasing (+ (car L) 1) L) (helper3_decreasing (cdr L))))))

  (helper2_decreasing (helper3_decreasing L)))

;Testing for part E

(display "Tesing for Part E\n\n")

(display "(decreasing '(3 6 8 9 7 4 8 6 3)) ->           ")
(decreasing '(3 6 8 9 7 4 8 6 3))
(display "(decreasing '(7 6 5 4 8 5 2 5 1 5 2 1)) ->     ")
(decreasing '(7 6 5 4 8 5 2 5 1 5 2 1))
(display "(decreasing '(1 2 3 3 3 4 5)) ->               ")
(decreasing '(1 2 3 3 3 4 5))

  