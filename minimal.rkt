#lang racket
(require racket/sequence)
(let ([lst (sequence->list (sequence-map (λ (x) (string-split x "|")) (in-lines)))] 
      [h (make-hash)])
  (map (λ (x) (if (hash-has-key? h (cadr x) ) 
                  (hash-update! h (cadr x) (λ (y) (set-add y (car x))))
                  (hash-set! h (cadr x) (set (car x))))) lst)
  (for ([i lst] #:when (> (set-count (hash-ref h (cadr i))) 1)) 
    (printf "~a|~a\n" (car i)(cadr i))))
