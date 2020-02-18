(defsystem :lpm-cli
  :pathname "src/cli"
  :depends-on (:just-getopt-parser)
  :components ((:file "package")
               (:file "cli")))
