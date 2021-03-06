; Mihir Gupta
; 101172281

(define-syntax stream-cons
  (syntax-rules ()
    ((stream-cons a b) (cons a (delay b)))))

(define (stream-car strm)
  (car strm))

(define (stream-cdr strm)
  (force (cdr strm)))

(define (stream-help a b)
  (stream-cons (expt a b)
               (stream-help (* 2 a) (+ b 1))))

(define (series)
  (stream-help 1 1))

