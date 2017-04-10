(defun copypaste/copy-region-or-line ()
(if (use-region-p)
    (message "jest")
  (message "nie"))
