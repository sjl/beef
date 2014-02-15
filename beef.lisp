(in-package :beef)


(defun slurp (path)
  "Sucks up an entire file from PATH into a freshly-allocated string,
   returning two values: the string and the number of bytes read."
  (with-open-file (s path)
    (let* ((len (file-length s))
           (data (make-string len)))
      (values data (read-sequence data s)))))

(defun spit (path str)
  "Spit the string into a file at the given path."
  (with-open-file (s path :direction :output :if-exists :supersede)
    (format s "~A" str)))
