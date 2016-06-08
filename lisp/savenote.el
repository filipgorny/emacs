(defun notes/save-current-buffer ()
  (interactive)
  (setq filename (concat "~/Documents/notes/" (format-time-string "%Y-%m-%d")))
  (when
      (not (file-exists-p filename))
    (with-temp-buffer (write-file filename))
      )
  (write-region (buffer-string) nil filename))

(global-set-key (kbd "M-n") 'notes/save-current-buffer)


