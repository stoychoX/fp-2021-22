(require rackunit rackunit/text-ui)

(define (level-flatten-iter l level)
  (cond ((null? l) '())
        ((null? (car l)) (level-flatten-iter (cdr l) level))
        ((pair? (car l)) (append (level-flatten-iter (car l) (+ level 1))
                                 (level-flatten-iter (cdr l) level)))
        (else (cons (+ (car l) level)
                    (level-flatten-iter (cdr l) level)))))

(define (level-flatten l)
  (level-flatten-iter l 1))

(define level-flatten-tests
  (test-suite
    "Tests for level-flatten"

    (check-equal? (level-flatten '()) '())
    (check-equal? (level-flatten '(())) '())
    (check-equal? (level-flatten '(1 (2 3) 4 (5 (6)) (7)))
                  '(2 4 5 5 7 9 9))
    (check-equal? (level-flatten '(1 (2 (2 4) 1) 0 (3 (1))))
                  '(2 4 5 7 3 1 5 4))))

(run-tests level-flatten-tests)
