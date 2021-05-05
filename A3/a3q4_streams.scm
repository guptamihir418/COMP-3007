; Mihir Gupta
; 101172281

(define-syntax stream-cons
(syntax-rules ()
((stream-cons a b) (cons a (delay b)))))
(define (stream-car str) (car str))
(define (stream-cdr str) (force (cdr str)))


; 1

(define (list->stream lis)
  (if (= 0 (length lis)) '()
      (stream-cons (car lis) (list->stream (cdr lis)))))


; 2
(define (stream->list strm n)
  (if (null? strm) (list )
      (if (or (eq? 0 n) (equal? strm (list ))) '()
          (cons (stream-car strm)
                (stream->list (stream-cdr strm) (- n 1))))))


; 3
(define (helper1_factorials n)
  (if (equal? 0 n) 1
      (* (helper1_factorials (- n 1)) n)))

(define (helper2_factorials i)
  (stream-cons (helper1_factorials i)
               (helper2_factorials (+ i 1))))

(define (factorials)  (helper2_factorials 0))


; 4
(define (prng V)
  (define v11 (expt 2 32))
  (define v12 22695477)
  (define (round_helper_function z nn)
    (let ((Val (expt 10 nn)))
      (/ (floor (+ (* z Val) 0.50)) Val)))
  
(stream-cons (round_helper_function
              (exact->inexact (/ (modulo (+ (* v12 V) 1) v11) v11)) 5)
             (prng (* v11 (exact->inexact
                           (/ (modulo (+ 1.0 (* v12 V)) v11) v11))))))


; 5
(define (random-int P Mini Maxi)
  (stream-cons (inexact->exact (floor (+ (* 10.0 (car P)) Mini)))
               (random-int (stream-cdr P) Mini Maxi)))

; Testing for Streams
(display "Testing for streams\n\n")

(display "(stream->list (factorials) 10)  ->                  ")
(stream->list (factorials) 10)

(display "(stream->list (prng 3) 5)  ->                       ")
(stream->list (prng 3) 5)
  
(display "(stream->list (random-int (prng 3) 10 20) 5)  ->    ")
(stream->list (random-int (prng 3) 10 20) 5)
