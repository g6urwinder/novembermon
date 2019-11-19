;; (push "c:/ideas/novembermon/" asdf:*central-registry*)
;; (ql:quickload :novembermon)
(defpackage novembermon
  (:use :cl))
(in-package :novembermon)

(defclass host (hunchentoot:acceptor)
  ((dispatch-table
    :initform '()
    :accessor dispatch-table
    :documentation "List of dispatch functions"))
  (:default-initargs
   :address "127.0.0.1"))

(defmethod hunchentoot:acceptor-dispatch-request ((host host) request)
  ;; try request on each dispatcher in turn
  (mapc (lambda (dispatcher)
          (let ((handler (funcall dispatcher request)))
            (when handler ; Handler found.
              (return-from hunchentoot:acceptor-dispatch-request (funcall handler)))))
        (dispatch-table host))
  (call-next-mentod))

(defun push-prefix-dispatcher (prefix fn)
  (push
   (hunchentoot:create-prefix-dispatcher prefix fn)
   (dispatch-table host)))
