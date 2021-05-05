; Mihir Gupta
; 101172281

;1
(define (tree-reduce op init t)
  (cond ((null? t) init)
        ((list? (car t)) (op (tree-reduce op init (car t))
                             (tree-reduce op init (cdr t))))
        (else (op (car t) (tree-reduce op init (cdr t))))))

;Testing for part A

(display "Tesing for Part A\n\n")
 
(display "(tree-reduce + 0 '(1 (2 3)((4 5) 6 (7)((8 (9)) 10)))) ->                    ")
(tree-reduce + 0 '(1 (2 3)((4 5) 6 (7)((8 (9)) 10))))

(display "(tree-reduce / 2 '(1 (2 3)((4 5) 6 (7)((8 (9)) 10)))) ->                    ")
(tree-reduce / 2 '(1 (2 3)((4 5) 6 (7)((8 (9)) 10))))

(display "(tree-reduce + 0 '(1 (2 3)((4 5) 6 (7)((8 (9)) 10 11 12 13 14 15))))  ->    ")
(tree-reduce + 0 '(1 (2 3)((4 5) 6 (7)((8 (9)) 10 11 12 13 14 15))))

(newline)


;2

(define (height LL)
  (if (null? LL) 0
      (if (not (list? LL)) 0
          (max (+ (height (car LL)) 1)
               (height (cdr LL))))))

;Testing for part B

(display "Tesing for Part B\n\n")

(display "(height 'a) ->                           ")
(height 'a)
(display "(height '(a)) ->                         ")
(height '(a))
(display "(height '(a (b) c)) ->                   ")
(height '(a (b) c))
(display "(height '(((((a(((b))))))))) ->          ")
(height '(((((a(((b)))))))))

(newline)


;3


(define (flatten-tree L)
  (cond ((null? L) '()) 
        ((list? (car L)) (append (flatten-tree (car L))
                                 (flatten-tree (cdr L))))
        (else (cons (car L) (flatten-tree (cdr L))))))

;Testing for part C

(display "Tesing for Part C\n\n")

(display "(flatten-tree '(1 (2 3) ((4 5 6 (7)))(((8 (9)))))) ->           ")
(flatten-tree '(1 (2 3) ((4 5 6 (7)))(((8 (9))))))

(display "(flatten-tree '(((2 3 4) (((4 5 6)) 9 9 9 ) 2 3 4) 8 )) ->      ")
(flatten-tree '(((2 3 4) (((4 5 6)) 9 9 9 ) 2 3 4) 8 ))

(newline)


; 4


(define (tree-merge T1 T2)
  (cond
    ((null? T2) (if (not (pair? T1)) (list ) T1))
    ((null? T1) (if (not (pair? T2)) (list ) T2))
    ((and (not (pair? T2)) (not (pair? T1))) (* T2 T1))
    ((not (pair? T1)) (cons (tree-merge T1 (car T2)) (tree-merge T1 (cdr T2))))
    (else (cond ((not (pair? T2)) (cons (tree-merge (car T1) T2)
                                         (tree-merge (cdr T1) T2)))
                (else (cons (tree-merge (car T1) (car T2))
                            (tree-merge (cdr T1) (cdr T2))))))))

;Testing for part D

(display "Tesing for Part D\n\n")

(display "(tree-merge '(2 (2 3) (4 5 (5 6 7))) '((5 (4 3) (2 1)) 6 (7 8))) -> \n")
(tree-merge '(2 (2 3) (4 5 (5 6 7))) '((5 (4 3) (2 1)) 6 (7 8)))
(newline)

(display "(tree-merge '(2 (2 3 4 5 6 6) ((5 6 7 9 9))) '((5 8 (4 2 3) (2 1)) 6 1 (7 2 8))) -> \n")
(tree-merge '(2 (2 3 4 5 6 6) ((5 6 7 9 9))) '((5 8 (4 2 3) (2 1)) 6 1 (7 2 8)))
