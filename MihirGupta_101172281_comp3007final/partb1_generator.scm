
(define (utilForLG A B C D E)
(if (and (< C D) (negative? E)) (list ) (if (and (> C D) (> E 0)) (list ) (if (A C) (append (list (B C)) (utilForLG A B (+ E C) D E)) (utilForLG A B (+ E C) D E)))))

(define (list-generator A B) (lambda (C D E) (utilForLG A B C D E)))



