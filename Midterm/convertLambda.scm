; convert all let in lambdas


(let ((a (let ((a 1)(b 2))(* a (+ b a)))) (b (* 3 (+ 4 2)))) (+ a (* b a)))

; doing it step by step -> first converted first let into lambda

((lambda (a b) (+ a (* b a))) (let ((a 1)(b 2))(* a (+ b a))) (* 3 (+ 4 2)))


; now picking up let value and converting to to lambda

;(let ((a 1)(b 2))(* a (+ b a)))

;((lambda (a b) (* a (+ b a))) 1 2)


; Final answer
((lambda (a b) (+ a (* b a))) ((lambda (a b) (* a (+ b a))) 1 2) (* 3 (+ 4 2)))