(defsystem "novembermon"
  :version "0.1.0"
  :author ""
  :license ""
  :depends-on ("hunchentoot" "drakma")
  :components ((:module "src"
                :components
                ((:file "main"))))
  :description ""
  :in-order-to ((test-op (test-op "novembermon/tests"))))

(defsystem "novembermon/tests"
  :author ""
  :license ""
  :depends-on ("novembermon"
               "rove")
  :components ((:module "tests"
                :components
                ((:file "main"))))
  :description "Test system for novembermon"
  :perform (test-op (op c) (symbol-call :rove :run c)))
