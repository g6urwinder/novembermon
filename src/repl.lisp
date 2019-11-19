(in-package :novembermon)

(multiple-value-bind
      (response _)
    (drakma:http-request "http://127.0.0.1:50001/tube")
  (declare (ignore _))
  (assert (string= response "LIGHT")))

(defun is-integral-multiple-of (m n)
  (equal 0 (mod m n)))

(is-integral-multiple-of 10 5)
;; T
(is-integral-multiple-of 10 3)
;; NIL

(defmacro make-is-integral-multiple-of (n)
  (let ((function-name (intern (concatenate
                                'string
                                (symbol-name :is-integral-multiple-of-)
                                (write-to-string n)))))
    `(defun ,function-name (x)
       (equal 0 (mod x ,n)))))
;; MAKE-IS-INTEGRAL-MULTIPLE-OF

(macroexpand-1 '(make-is-integral-multiple-of 3))
;; (DEFUN IS-INTEGRAL-MULTIPLE-OF-3 (X) (EQUAL 0 (MOD X 3)))

(make-is-integral-multiple-of 3)
;; IS-INTEGRAL-MULTIPLE-OF-3
(make-is-integral-multiple-of 4)
;; IS-INTEGRAL-MULTIPLE-OF-4

(ql:quickload :screamer)
(require :screamer)
(use-package :screamer)

(all-values (an-integer-between 0 9))
;; (0 1 2 3 4 5 6 7 8 9)

(reduce '+ (all-values (let ((domain (an-integer-between 1 999)))
               (assert! (orv (is-integral-multiple-of-3 domain)
                             (is-integral-multiple-of-4 domain)))
               domain)))
;; 249501

(defun fibonacci-sequence (n)
  (let ((a 0) (b 1) (c 0))
    (loop while (< (+ a b) n) collect
          (setq c (+ a b)
                a b
                b c))))
(screamer::defun a-fibonacci-number-below (max)
  (let ((x (a-member-of (fibonacci-sequence max))))
    x))
;; A-FIBONACCI-NUMBER-BELOW

(reduce '+
        (all-values (let ((x (a-fibonacci-number-below 400000000)))
                         (assert! (evenp x))
                      x)))
;; 350704366
