; Mihir Gupta
; 101172281

(define (split Predicate List)
  (define (one Predicate List)
    
    (cond
      ((eq? 0 (length List)) List)
      ((not (Predicate (car List))) (cons (car List) (one Predicate (cdr List))))
      (else (one Predicate (cdr List)))))

  (define (two Predicate List)
    (cond
      ((eq? 0 (length List)) List)
      ((Predicate (car List)) (cons (car List) (two Predicate (cdr List))))
      (else (two Predicate (cdr List)))))
  
  (cons (two Predicate List) (one Predicate List)))


(split even? '(1 2 1 3 2 2 4))