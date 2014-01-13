#lang racket

(let ([lst (map (λ (x) (string-split x "|")) (file->lines "test.in"))] 
      [h (make-hash)])
  (map (λ (x) (if (hash-has-key? h (cadr x) ) (hash-update! h (cadr x) (λ (y) (set-add y (car x))))
                  (hash-set! h (cadr x) (set (car x))))) lst)
  (for ([i lst] #:when (> (set-count (hash-ref h (cadr i))) 2)) (printf "~a\n" i)))
