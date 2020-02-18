(defsystem "lpm-executable"
  :build-operation program-op
  :build-pathname "lpm"
  :depends-on (:lpm-cli :lpm)
  :entry-point "lpm-executable::main")
