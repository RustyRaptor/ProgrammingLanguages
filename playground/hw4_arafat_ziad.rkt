#lang racket/base
(require math)

; Solution using Logarithms to check if its a power. 
; Runs in O(1) time as opposed to O(log n)
; Params:
;       n
; Returns: 
;       A new list with inserted-element inserted at position insertion-index
(define (power-four? checked-number)
        (let ([log-base-4 (/ (log checked-number) (log 4))])
                (and (integer? log-base-4) (>= checked-number 1)))
)

; Params:
;       input-list: a list of inserted-elementents
;       inserted-element: an inserted-elementent to insert
;       insertion-index: the index to insert the inserted-elementent at
;
; Returns:
;       A new list with inserted-element inserted at position insertion-index
(define (insert-at input-list inserted-element insertion-index)
        (cond
                ; If the insertion index = 0 append it to the beginning with cons.
                [(= insertion-index 0) (cons inserted-element input-list)]
                ; If its empty just return a list with the element
                [(null? input-list) (list inserted-element)]
                ; Else concat the head with a recursive call on the tail. 
                [else
                        (cons
                                (car input-list)
                                (insert-at
                                        (cdr input-list)
                                        inserted-element
                                        (sub1 insertion-index)
                                )
                        )
                ]
        )
)

; Checks if two lists left and right are equal
; Params:
;       left-list: The left list to check
;       right-list: the right list to check
; Returns: 
;       True if they are same False otherwise
(define (equal-lists? left-list right-list)
        (cond 
                [(null? left-list) (null? right-list)]
                [(null? right-list) #f]
                [(equal? (car left-list) (car right-list)) 
                        (equal-lists? (cdr left-list) (cdr right-list))]
                [else #f]
        )
)

; Checks a list is a palindrome
; Params:
;       checked-list: the list to chck for palindromeness
; Returns: 
;       1 if it's a palindrome otherwise 0
(define (palindrome? checked-list)
        ; if the list is equal to it's reverse
        (if (equal-lists? checked-list (reverse checked-list))
                1 ; Return 1 if true
                0 ; else return 0
        )
)


; Checks a number is divisible by a given divisor
; Params:
;       checked-number: the number to check divisibility of
;       divisor: the divisor to check it by
; Returns: 
;       #t if it is divisible else #f
(define (is-divisible? checked-number divisor)
        (if (= divisor 1)
                #f
                (if (= (remainder checked-number divisor) 0)
                        #t
                        (is-divisible? checked-number (- divisor 1))
                )
        
        )
)

; Checks if a number is prime
; Params:
;       checked-number: the number to check primeness of
; Returns: 
;       0 if it's prime
;       else 1
(define (prime? checked-number)
        ; if checked-number <= 1
        (if (<= checked-number 1)
                1 ; Return 1
                ; else check if it's divisible by number
                (if (is-divisible? checked-number (floor (sqrt checked-number)))
                        1 ; Return 1 if it is divisible
                        0 ; Otherwise return 0
                )
        )
)

(define (fib-go n a b)
        (cond
                [(= n 0) a]
                [(= n 1) b]
                [else (fib-go (- n 1) b (+ a b))]
        )
)

(define (fibonacci n)
        (fib-go n 0 1)
)

; (define (fibonacci n)
;         (cond
;                 [(= n 0) 0]
;                 [(= n 1) 1]
;                 [(> n 1) (+ (fibonacci (- n 1)) (fibonacci (- n 2)))]
;         )
; )


; (define (factorial n)
;         (cond
;                 [(= n 0) 1]
;                 [else (* n (factorial (- n 1)))]
;         )
; )

(define (factorial n)
        (factorial-go n n)
)

(define (factorial-go n acc)
        (cond
                [(= n 0) 1]
                [(= n 1) acc]
                [else (factorial-go (- n 1) (* acc (- n 1)))]
        )
)

(define (reversed-list-go input-list result)
        (cond
                [(null? input-list) result]
                [else (reversed-list-go (cdr input-list) (cons (car input-list) result))]
        )
)

(define (reversed-list input-list)
        (reversed-list-go input-list '())
)

(display "FIBBONACCI")
(newline)
(fibonacci 0)
(fibonacci 1)
(fibonacci 2)
(fibonacci 3)
(fibonacci 4)
(fibonacci 5)
(fibonacci 10)

(display "Factorial")
(newline)
(factorial 0)
(factorial 1)
(factorial 2)
(factorial 3)
(factorial 4)
(factorial 5)
(factorial 10)

(display "Reversal")
(newline)
(reversed-list '())
(reversed-list '(1))
(reversed-list '(1 2 3 4 5))

