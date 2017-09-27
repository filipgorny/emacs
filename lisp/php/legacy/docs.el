(defun add-doc-to-current-methodline ()
  (setq currentline (thing-at-point 'line t))
  (insert (

(defun print-doc ()
  (interactive)
  (insert "\n\t/**\n")
  (print-params methodline))

(print-doc)


(defun get-params ()
  (
   ))

(defun print-params (methodline)
  (setq params (split-string (nth 1 (split-string (nth 0 (split-string methodline ")")) "(")) ", "))
  (mapcar (lambda (param)
            (insert (concat "\t * @param " param "\n"))
                  ) params))
  )

(setq methodline "public function foo(Bar $biz, Ded $baw): $bob")

(print-params methodline)
