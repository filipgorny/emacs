(fset 'yes-or-no-p 'y-or-n-p)

(defun get-current-word ()
  (thing-at-point 'word))

(defun get-current-line ()
  (thing-at-point 'line))

(defun buffer-contains-string (string)
  (save-excursion
    (save-match-data
      (goto-char (point-min))
      (re-search-forward string nil t))))

(defun delete-current-line ()
  "Delete (not kill) the current line."
  (interactive)
  (save-excursion
    (delete-region
     (progn (forward-visible-line 0) (point))
     (progn (forward-visible-line 1) (point)))))

(defun string-replace (what with in)
  (replace-regexp-in-string (regexp-quote what) with in nil 'literal))

(defun string-clear (whats in)
  (setq replacing in)
  (mapcar (lambda (what)
            (setq replacing (string-replace what "" replacing))
            ) whats)
  (concat replacing)
  )
