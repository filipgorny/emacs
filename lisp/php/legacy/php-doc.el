(defun phpdoc/generate-method-doc
     (concat "/**\n"
             (mapcar (lamba ()
                         ())))
     ))

(defun phpdoc/generate-arguments-section (args)
  (mapcar (lambda (em)
          (let ((sem (split-string em " ")))
            (if (eq (length sem) 2)
                (concat " " (first sem) " " (second sem) "\n")
              (concat " " "mixed" " " em "\n"))
            )) args))

(phpdoc/generate-arguments-section '("Repository $repository" "$count"))
