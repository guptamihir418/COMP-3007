(define (f x y)
  (+ x (* x y) y))

(f (log (/ 10 3)) (+ (* 8 5) 2))

; Substituion model -> Applicative order

; (f (log (/ 10 3)) (+ (* 8 5) 2))    -> x = (log (/ 10 3))    y -> (+ (* 8 5) 2)
; (f 1.204 (+ 40 2))
; (f 1.204 42)
; (+ 1.204 (* 1.204 42) 42)
; (+ 1.204 50.568 42)
; 93.77199999999999      -> 93.77083058601525

; Substitution model -> Normal order

; (f (log (/ 10 3)) (+ (* 8 5) 2))    -> x = (log (/ 10 3))    y -> (+ (* 8 5) 2)
; (+ (log (/ 10 3)) (* (log (/ 10 3)) (+ (* 8 5) 2)) (+ (* 8 5) 2))
; (+ (log (/ 10 3)) (* (log (/ 10 3)) (+ 40 2)) (+ (* 8 5) 2))
; (+ (log (/ 10 3)) (* (log (/ 10 3)) 42) (+ (* 8 5) 2))
; (+ (log (/ 10 3)) (* (log (/ 10 3)) 42) (+ 40 2))
; (+ (log (/ 10 3)) (* (log (/ 10 3)) 42) 42)
; (+ (log (/ 10 3)) (* 1.204 42) 42)
; (+ 1.204 50.568 42)
; 93.77199999999999


#| Applicative order is a.k.a strict order evaluation, which will simplify the arguments
given in the function (if not simplified) then will sub in those simplified values in the
function body and evaluate the answer, this is generally the efficient way becasue it avoids
repeated evaluation of the arguments |#

#| Normal order is a.k.a non strict evaluation, which will only evaluate the expression
until the value is needed. |#

#| The strategy that would be efficient in this case will be applicative order becasue
 it will avoid evaluating these two expressions (log (/10 3)) and (+ (* 8 5) 2) more than
 once, becasue in normal order we will not evaluate these expressions until the value is
 needed from this, so if you will see in function body x and y are repeated two times, so
 the abpve expressions will be evaluated 2-2 times each, and hence reducing efficiency |#

