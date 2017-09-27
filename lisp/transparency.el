(setq transparency nil)

(defun transparency/toggle ()
  (interactive)
  (setq transparency (not transparency))
  (if (eq transparency 't)
      (set-frame-parameter (selected-frame) 'alpha '(85 . 50))
    (set-frame-parameter (selected-frame) 'alpha '(100 . 50))))

(global-set-key (kbd "<f9>") 'transparency/toggle)
