(defun flisp-get-line ()
  (string-trim (replace-regexp-in-string "[\t]" "" (replace-regexp-in-string "\n$" "" (thing-at-point 'line t)))))

(defun flisp-foreach (iterable method)
  (mapcar (lambda (element)
            (funcall method element)
            ) iterable))


(defun flisp-block-wrap (text header inside bottom)
  (let ((lines (split-string inside "\n"))
        (content (concat header "\n" (split-string "\n" inside)))
        )
    ))
