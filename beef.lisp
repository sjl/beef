(in-package :beef)


(defun split-lines (s)
  (split-sequence #\newline s))

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


(defun slurp-lines (path)
  (split-lines (slurp path)))


(defparameter whitespace-chars '(#\space #\tab #\newline))

(defun trim-whitespace (s)
  (string-trim whitespace-chars s))

(defun trim-whitespace-left (s)
  (string-left-trim whitespace-chars s))

(defun trim-whitespace-right (s)
  (string-right-trim whitespace-chars s))
