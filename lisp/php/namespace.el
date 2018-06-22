(defun fphp/insert-use-statement (classname)
  "Insert CLASSNAME after the last use statement at the top of this file."
  (interactive)
  (save-excursion
    (goto-char (point-max))
    (if (not (re-search-backward "^use" nil t))
        (progn
          (goto-char (point-min))
          (if (not (re-search-forward "^namespace" nil t))
              (error "Namespace declaration not found."))
          (end-of-line)
          (newline)))
    (end-of-line)
    (newline)
    (insert (concat "use " classname ";"))))
