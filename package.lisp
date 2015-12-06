(defpackage :beef
  (:use :cl)
  (:use #:split-sequence)
  (:export
    #:split-lines

    #:slurp
    #:spit

    #:slurp-lines

    #:trim-whitespace
    #:trim-whitespace-left
    #:trim-whitespace-right

    #:index
    #:slice

    #:partial
    ))
