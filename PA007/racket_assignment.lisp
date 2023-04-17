#lang racket/base
(require math)

;; (define (sumevens list)
;;         (cond
;;                 [(null? list) 0]
;;                 [(zero? (modulo (car list) 2)) 
;;                         (+(car list) (sumevens (cdr list)))
;;                 ]
;;                 [else  (sumevens (cdr list))]
;;         )

        
;; )

; Recursive solution runs in O(log n) time. 
;; (define (power-four? n)
;;         (cond
;;                 [(< n 1) #f]
;;                 [(= n 1) #t]
;;                 [else (power-four? (/ n 4))]
;;         )
;; )

; Solution using Logarithms to check if its a power. 
; Runs in O(1) time as opposed to O(log n)
(define (power-four? n)
        (let ([log-base-4 (/ (log n) (log 4))])
                (and (integer? log-base-4) (>= n 1)))
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
                [(= insertion-index 0) (cons inserted-element input-list)]
                [(null? input-list) (list inserted-element)]
                [else 
                        (cons (car input-list)
                                (insert-at 
                                        (cdr input-list)
                                        inserted-element 
                                        (sub1 insertion-index))
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

(define (is-divisible? checked-number divisor)

        (if (= divisor 1)
                #f
                (if (= (remainder checked-number divisor) 0)
                        #t
                        (is-divisible? checked-number (- divisor 1))
                )
        
        )
)

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

; Test cases for power-four?
(display "POWER FOUR")
(newline)
(display (power-four? 1)) ; #t
(newline)
(display (power-four? 4)) ; #t
(newline)
(display (power-four? 16)) ; #t
(newline)
(display (power-four? 20)) ; #f
(newline)
(display (power-four? 64)) ; #t
(newline)

; Test cases for insert-at
(display "INSERT AT")
(newline)
(display (insert-at '(1 2 3 4) 0 1)) ; (1 0 2 3 4)
(newline)
(display (insert-at '(1 2 3 4) 5 2)) ; (1 2 5 3 4)
(newline)
(display (insert-at '(1 2 3 4) 5 0)) ; (5 1 2 3 4)
(newline)
(display (insert-at '(1 2 3 4) 5 4)) ; (1 2 3 4 5)
(newline)
(display (insert-at '() 5 0))        ; (5)
(newline)

; Test cases for palindrome?
(display "PALINDROME")
(newline)
(display (palindrome? '(1 2 3 2 1))) ; 1
(newline)
(display (palindrome? '(1 2 3 4 5))) ; 0
(newline)
(display (palindrome? '()))          ; 1
(newline)
(display (palindrome? '(1)))         ; 1
(newline)
(display (palindrome? '(1 2 1)))      ; 1
(newline)
(display (palindrome? '(1 2 2 1)))    ; 1
(newline)
(display (palindrome? '(1 2 3 1)))    ; 0
(newline)