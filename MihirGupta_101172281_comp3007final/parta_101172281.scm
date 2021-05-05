; 3,4,6,9

; Q3
(define (infuse Ls k m Vals)
  (cond
    ((zero? (length Ls)) (list ))
    ((and (zero? m) (zero? k)) (append Vals Ls))
    ((zero? k) (infuse (cdr Ls) k (- m 1) Vals))
    (else (cons (car Ls) (infuse (cdr Ls) (- k 1) m Vals)))))


; Q4
(define (fold_once Ls)
  (define (utilfoldOnce  Ls g h)
    (cond
      ((zero? (length Ls)) (list ))
      ((equal? 1 (- h g)) (list (+ (list-ref Ls h) (list-ref Ls g))))
      ((equal? g h) (list (list-ref Ls g)))
      (else (cons (+ (list-ref Ls h) (list-ref Ls g)) (utilfoldOnce  Ls (+ 1 g) (- h 1))))))
  (utilfoldOnce  Ls 0 (- (length Ls) 1)))


; Q6
(define (globs Vals)
  (define (utilGlobs Ls Ires)
    (cond
      ((zero? (length Ls)) (list ))
      ((and (equal? 2 (length Ls)) (equal? (car Ls) (cadr Ls)))
       (list (cons (car Ls) (list (+ 2 Ires)))))
      ((and (equal? 2 (length Ls)) (not (equal? (car Ls) (cadr Ls))))
       (list (cons (car Ls) (list (+ Ires 1))) (cons (cadr Ls) (list 1))))
      ((not (equal? (car Ls) (cadr Ls)))
       (cons (cons (car Ls) (list (+ 1 Ires))) (utilGlobs (cdr Ls) 0)))
      (else (utilGlobs (cdr Ls) (+ Ires 1))))) (utilGlobs Vals 0))



; Q9
(define (minima items)
  (define (utilMinima items x y)
    (cond ((< y x) (list ))
          ((and (< (list-ref items x) (list-ref items (+ 1 x)))
                (< (list-ref items x) (list-ref items (- x 1))))
           (cons (- x 1) (utilMinima items (+ 1 x) y)))
          (else (utilMinima items (+ 1 x) y))))
  (utilMinima (append (list 0) items (list 0)) 1 (length items)))


; Testing
(infuse '(a b c d e) 2 1 '(x y)) 
(infuse '(1 2 3 4 5) 2 0 '(x y))
(infuse '(a b c d e) 2 1 '())
(fold_once '(6 2.5 9 1 5 7 8 4))
(fold_once '(1 2 3 4 5))
(globs '(a a g g a a a a t c))
(globs '(t t t a a c g t))
(minima '(1 5 9 3 5 4 8))
(minima '(-42 25 -1))
(minima '(0 1 0 0 0 -1 1 1 -1 1 0 1))
(minima '(6 4 2 1 3 5))
