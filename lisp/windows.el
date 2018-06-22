(setq previous-window 'nil)

(defun window-fwd ()
  (interactive)
  (setq previous-window (get-buffer-window))
  (other-window 1)
  )

(defun window-back ()
  (interactive)
  (if (previous-window)
      (select-window previous-window)))

(global-set-key (kbd "M-p") 'window-fwd)
(global-set-key (kbd "M-o") 'window-back)
