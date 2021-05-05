; MIHIR GUPTA
; 101172281

; A -> checks if the string is palindrome or not

(define (palindrome? s)
  (let ((length (string-length s))
        (run (- (/ (string-length s) 2) 1))) ; run is length/2 - 1
    
    (define (iterator count l1 l2)  ; l1 is first char of string, l2 is last char of same string
      (if (> count run)
          #t
          (if (eq? l1 l2)
              (iterator (+ count 1) (string-ref s (+ count 1)) (string-ref s (- length (+ count 1) 1)))
              #f
               )))
    
    (iterator 0 (string-ref s 0) (string-ref s (- length 1)))))


; Testing cases
(display "Testing cases for part A\n\n")

(display "(palindrome? 'kaak') => ")  ; k=k, a=a => #t
(palindrome? "kaak")

(display "(palindrome? 'tacocat') => ")  ; t=t, a=a, c=c, o => #t
(palindrome? "tacocat")

(display "(palindrome? 'taco cat') => ") ; t=t, a=a, c=c, 0!=' ' => #f
(palindrome? "taco cat")

(display "(palindrome? 'tacadsfafasfcasct') => ") ; t=t, a!=c => #f
(palindrome? "tacadsfafasfcasct")

(display "(palindrome? 'taaaaaaaat') => ") ; t=t, a=a, a=a, a=a, a=a => #t
(palindrome? "taaaaaaaat")

(display "(palindrome? '001100') => ")  ; 0=0, 0=0, 1=1  => #t
(palindrome? "001100")

(newline)
(newline)


  
; B -> Checks if the string is k-palindrome?

(define (k-palindrome? S k)
  
  (define (string-reverse A Len)  ; gets the reverse of the string
    (if (= 0 Len) (string (string-ref A 0)) (string-append (string (string-ref A Len)) (string-reverse A (- Len 1)))))
  
  (define (util_for_k_palindrome A B X Y)
    (cond
      ((or (zero? X) (zero? Y)) (if (zero? X) Y X))
      
      ((eq? (string-ref B (- Y 1)) (string-ref A (- X 1)))
       (util_for_k_palindrome A B (- X 1) (- Y 1)))
      
      (else (+ (min (util_for_k_palindrome A B (- X 1) Y)
                    (util_for_k_palindrome A B X (- Y 1))) 1))))
  
(>= (* k 2) (util_for_k_palindrome S (string-reverse S (- (string-length S) 1))
                                   (string-length S)
                                   (string-length S))))

; Testing cases
(display "Testing cases for part B\n\n")

(display "(k-palindrome? 'tahcohcat' 2) => ")  ; so if we remove either both c's or both h's it becomes 2-palindrome => #t
(k-palindrome? "tahcohcat" 2)

(display "(k-palindrome? 'tahcohcat' 1) => ")  ; we need to remove min 2 chars, so it is not 1-palindrome => #f
(k-palindrome? "tahcohcat" 1)

(display "(k-palindrome? 'abcdecba' 1) => ")  ; we need to remove either d or e, so it is 1-palindrome => #t
(k-palindrome? "abcdecba" 1)

(display "(k-palindrome? 'acdcb' 1) => ") ; we need to remove minimum 2 chars a and b, so it is not 1-palindrome => #f
(k-palindrome? "acdcb" 1)
 
