#lang racket
(require rackunit)
(require rackunit/text-ui)

(require "common.03.rkt")

;### Зад 6
; Имплементирайте `prime?` чрез `accumulate` или `accumulate-i`.
(define (prime?-acc n)
  'тук)

(run-tests
  (test-suite
    "prime?-acc tests"
    (check-false (prime?-acc 0))
    (check-false (prime?-acc 1))
    (check-false (prime?-acc -120))
    (check-false (prime?-acc 120))
    (check-true (prime?-acc 2))
    (check-true (prime?-acc 3))
    (check-true (prime?-acc 7))
    (check-true (prime?-acc 101))
    (check-true (prime?-acc 2411)))
  'verbose)
