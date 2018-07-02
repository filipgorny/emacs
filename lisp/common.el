(fset 'yes-or-no-p 'y-or-n-p)

(defun get-current-word ()
  (thing-at-point 'word))

(defun buffer-contains-string (string)
  (save-excursion
    (save-match-data
      (goto-char (point-min))
      (re-search-forward string nil t))))
