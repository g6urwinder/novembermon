(defpackage novembermon
  (:use :cl))
(in-package :novembermon)

(defvar host (make-instance 'host :port 50001))
(hunchentoot:start host)

(push-prefix-dispatcher "/foo" 'foo)
(defun foo () "GOOD")

(push-prefix-dispatcher "/tube" 'tube)
(defun tube () "LIGHT")

