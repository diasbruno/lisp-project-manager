(defsystem :lpm
  :pathname "apps"
  :depends-on (:lpm-cli)
  :components ((:file "main")))
