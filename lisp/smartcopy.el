(defun copy-current-line ()
  (interactive)
  (let* 
         ((beg (save-excursion (beginning-of-line) (point)))
         (end (save-excursion (end-of-line) (point)))
         (line (buffer-substring-no-properties beg end)))
    (kill-new line))
  )

(global-set-key (kbd "C-c C-c") 'copy-current-line)
