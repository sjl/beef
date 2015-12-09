(defpackage :beef
  (:use :cl)
  (:use #:split-sequence)
  (:export
    #:hash-keys
    #:hash-values

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
