(defpackage :lpm-executable
  (:use :cl :just-getopt-parser)
  (:export #:main))
(in-package :lpm-executable)

(defvar *default-config-file-names*
  ".configuration"
  "Default configuration file name.")

(defun read-configuration-file (filename)
  "Read the configuration from FILENAME."
  (let ((file (merge-pathnames (car (directory ".")) filename)))
    (uiop:eval-input
     (uiop:read-file-string file))))

(lpm-cli:cli
 runner
 (:opts ((:verbose #\v :optional)) (args)
        (format t "base cli: ~a~&" args))
 (:cmd create nil (args)
       (declare (ignore args))
       (format t "create a new application."))
 (:cmd create/template ((:verbose #\v :required)) (args)
       (declare (ignore args))
       (format t "create a new application from a template."))
 (:cmd make ((:app #\a :optional)
             (:app "app" :optional)) (args)
       (asdf:make (cdar args)))
 (:cmd help ((:verbose #\v :optional)) (args)
       (format t "usage: ~a~&" args)))

(defun main ()
  (handler-case
      (runner (uiop:command-line-arguments))
    (just-getopt-parser:unknown-option () (help nil))))
