#lang racket/base

;; (define (sumevens list)
;;         (cond
;;                 [(null? list) 0]
;;                 [(zero? (modulo (car list) 2)) 
;;                         (+(car list) (sumevens (cdr list)))
;;                 ]
;;                 [else  (sumevens (cdr list))]
;;         )

        
;; )

(define (powerfour n)
        (cond
                [(< n 1) #f]
                [(= n 1) #t]
                [else (powerfour (/ n 4))]
        )
)
