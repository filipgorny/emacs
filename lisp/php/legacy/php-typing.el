(defun php-typing/property (name)
  (concat "private $" (thing-at-point 'line t) ";")
  )

(defun php-typing/complete (method)
  (funcall (intern method) (replace-regexp-in-string "\n$" "" (thing-at-point 'line t)))
  )

(lambda ()
  (php-typing/convert-to-property "user")
  (php-typing/complete "php-typing/property"))
