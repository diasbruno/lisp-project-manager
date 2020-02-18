(defsystem "lpm-executable"
  :build-operation program-op
  :build-pathname "lpm"
  :depends-on (:just-getopt-parser :lpm)
  :entry-point "lpm-executable::main")
