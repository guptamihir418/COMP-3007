; Mihir Gupta
; 101172281

(define (expand-help n1 n2)
  (if (= 0 n2) '() (cons n1 (expand-help n1 (- n2 1)))))

(define (expand Lis n)
  (if (null? Lis) '() (append (expand-help (car Lis) n) (expand (cdr Lis) n))))


(expand '(1 2 2 3 4) 3)