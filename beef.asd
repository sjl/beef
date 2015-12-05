(asdf:defsystem #:beef
  :depends-on (#:split-sequence)
  :serial t
  :components ((:file "package")
               (:file "beef")))

