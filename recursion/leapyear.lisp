#lang racket/base
(define (isleap year) 
        (cond
                ((zero? (modulo year 400)) #T)
                ((zero? (modulo year 100)) #F)
                (else (zero? (modulo year 4))#T)
))

(define (is_in_there item list)
        (cond
                [(null? list) #F]
                [(= (car list) item) #T]
                [else (is_in_there item (cdr list))]
        )
)

(is_in_there 5 '(5))