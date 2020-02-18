(defsystem :lpm
  :pathname "apps"
  :depends-on (:cl-cli)
  :components ((:file "main")))
