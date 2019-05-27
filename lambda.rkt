;; Booleans

(define (true a)
  (lambda (b) a))

(define (false a)
  (lambda (b) b))

(define (not a)
  ((a false) true))

(define (and a)
  (lambda (b)
    ((a b) a)))

(define (or a)
  (lambda (b)
    ((a a) b)))

;; Numbers
;; In general, a number is a function that gets passed a function
;; and returns a function that calls the input function n times on its
;; input, where n is the ordinality of the number.
;; For example, two would be defined as:
;;
;;     (define (two f)
;;       (lambda (x) (f (f x))))
;;
;; However, we actually just define zero to be the axiomatic number
;; and define all other numbers in relation to it via the successor
;; procedure.

(define (zero f)
  (lambda (x) x))

;; Successor takes a number n and returns the next number.
;; For example:
;;     (define one (successor zero))
(define (successor n)
  (lambda (f)
    (lambda (x)
      (f ((n f) x)))))

(define (add a)
  (lambda (b)
    ((b successor) a)))

(define (multiply a)
  (lambda (b)
    ((b (add a)) zero)))
