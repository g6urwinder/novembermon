(asdf:load-system :cffi)

(defpackage :cffi-user
  (:use :common-lisp :cffi))
(in-package :cffi-user)

(define-foreign-library libcurl
  (:darwin (:or "libcurl.3.dylib" "libcurl.dylib"))
  (:unix (:or "libcurl.so.3" "libcurl.so"))
  (t (:default "libcurl")))
(use-foreign-library libcurl)

(defcallback sum :int ((a :int) (b :int))
  (+ a b))
;; SUM
(callback sum)
;; #.(SB-SYS:INT-SAP #X20100C70)

