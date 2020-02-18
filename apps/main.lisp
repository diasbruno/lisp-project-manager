(defpackage :lpm-executable
  (:use :cl :just-getopt-parser)
  (:export #:main))
(in-package :lpm-executable)

(defvar *options* '((:verbose #\v))
  "Command line options.")

(defvar *default-config-file-names*
  ".configuration"
  "Default configuration file name.")

(defun cli-args ()
  "Get command line arguments."
  (just-getopt-parser:getopt (uiop:command-line-arguments)
                             *options*
                             :options-everywhere t))

(defun read-configuration-file (filename)
  "Read the configuration from FILENAME."
  (let ((file (merge-pathnames (car (directory ".")) filename)))
    (uiop:eval-input
     (uiop:read-file-string file))))

(defun main ()
  (let* ((config (read-configuration-file
                  *default-config-file-names*))
         (options (cli-args)))
    (format t "ok~& ~a~& ~a~&" options config)))
