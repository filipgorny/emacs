(fset 'yes-or-no-p 'y-or-n-p)

(defun get-current-word ()
  (thing-at-point 'word))
