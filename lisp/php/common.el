(defun fphp/goto-end-of-class ()
  (interactive)
  (goto-char (point-max))
  (re-search-backward "^}" nil t)
  (previous-line)
  (end-of-line)
  )

(defun fphp/get-property-type (p)
  (save-excursion
    (setq type "")
    (goto-char (point-min))
    (re-search-forward (concat "private " p) nil t)
    (previous-line)
    (if (string= (string-trim (get-current-line)) "*/")
        (progn
          (if (re-search-backward "@var" nil t)
              (setq type (string-replace p "" (string-clear '("*" " " "@var" "\n") (get-current-line)))))
          )))
  (concat type)
  )
