#lang racket/base

(define (sumevens list)
        (cond
                [(null? list) 0]
                [(zero? (modulo (car list) 2)) 
                        (+(car list) (sumevens (cdr list)))
                ]
                [else  (sumevens (cdr list))]
        )

        
)

(define (get_nth_slice list n)
        (cond
                [(null? list) list]
                [(zero? (n)) list]
                [else (get_nth_slice (cdr list) (- n 1))]
        )
)

(define (sumnth list n)
        (cond
                [(null? list) 0]
                [else  (sumnth (get_nth_slice list n) n )]
        )

        
)
(sumnth '(5 5 5 5 2 7 7 9) 4)