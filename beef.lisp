(in-package :beef)


;;;; Hash Tables
(defun hash-keys (table)
  (loop :for k :being :the hash-keys :of table :collect k))

(defun hash-values (table)
  (loop :for v :being :the hash-values :of table :collect v))


;;;; Sequence Indexing/Slicing
(defun calc-index (coll i)
  (if (>= i 0)
    i
    (+ (length coll) i)))

(defun index (coll i)
  (elt coll (calc-index coll i)))

(defun slice (coll start end)
  (subseq coll (calc-index coll start) (calc-index coll end)))


;;;; Splitting Lines
(defun split-lines (s)
  (split-sequence #\newline s))


;;;; Slurp/Spit
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

(defun slurp-lines (path &key (ignore-trailing-newline nil))
  (let ((data (slurp path)))
    (if (and ignore-trailing-newline
             (eql #\newline (index data -1)))
      (split-lines (slice data 0 -1))
      (split-lines data))))


;;;; Trimming Whitespace
(defparameter whitespace-chars '(#\space #\tab #\newline))

(defun trim-whitespace (s)
  (string-trim whitespace-chars s))

(defun trim-whitespace-left (s)
  (string-left-trim whitespace-chars s))

(defun trim-whitespace-right (s)
  (string-right-trim whitespace-chars s))


;;;; Functional Stuff
(defun partial (fn &rest args)
  (lambda (&rest more-args)
    (apply fn (concatenate 'list args more-args))
    )
  )
