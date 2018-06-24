(defun fphp/goto-end-of-class ()
  (interactive)
  (goto-char (point-max))
  (re-search-backward "^}" nil t)
  (previous-line)
  (end-of-line)
  )

(defun fphp/get-property-type (name)
  (concat name))

(lambda ()
  (fphp/goto-end-of-class)
  )
