; 1
(define (eval-prefix m)
  (define (supporter_Prefix m)
    (if (equal? m '+) + (if (equal? m '-) - (if (equal? m '*) * /))))
  (if(number? m) m ((supporter_Prefix (car m)) (eval-prefix (cadr m)) (eval-prefix (caddr m)))))




; 2
(define (utilForinfixA items)
  (if (eq? (length (cddr items)) 0) '()
    (append (list (car items)) (utilForinfixA (cdr items)))))


(define (utilForinfixE items)
  (if (equal? items '*) 2
    (if (equal? items '/) 2 (if (equal? items '+) 1 1))))


(define (utilForinfixB items B)
  (if(< (utilForinfixE items) (utilForinfixE B)) #f #t))


(define (utilForinfixC items)
  (if (eq? 1 (length items)) (car items) (utilForinfixC (cdr items))))


(define (utilForinfixD items)
  (if (eq? 2 (length items)) (car items) (utilForinfixD (cdr items))))


(define (parse-infix items)
  (if (and (pair? items) (equal? 0 (length (cdr items)))) (parse-infix (car items))
      (if (and (pair? items) (equal? (length items) 3)) (list (cadr items) (parse-infix (car items)) (parse-infix (caddr items)))
          (if (and (pair? items) (equal? #f (utilForinfixB (cadr items) (utilForinfixD items)))) (list (cadr items) (parse-infix (car items)) (parse-infix (cddr items)))
              (if (and (pair? items) (equal? #t (utilForinfixB (cadr items) (utilForinfixD items)))) (list (utilForinfixD items) (parse-infix (utilForinfixA items)) (parse-infix (utilForinfixC items))) items)))))


