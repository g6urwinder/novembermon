(asdf:load-system :cffi)
(defpackage :cffi-user
  (:use :common-lisp :cffi))
(in-package :cffi-user)

(define-foreign-library libsysteminfo
  (t (:default "./libsysteminfo")))
(load-foreign-library 'libsysteminfo)

(defcfun "get_ncpu" :int)
(defun print-system-info ()
  (let ((ncpu (get-ncpu)))
    (format t "CPUs: = ~d" ncpu)))
(print-system-info)
;; CPUs: = 8