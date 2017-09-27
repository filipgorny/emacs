(setq transparency/on nil)

(defun transparency/toggle ()
  (interactive)
  (setq transparency/on (not transparency/on))
  (if (eq t transparency/on)
      (set-frame-parameter (selected-frame) 'alpha '(85 . 50))
    (set-frame-parameter (selected-frame) 'alpha '(100 . 50))))

(global-set-key (kbd "<f8>") 'transparency/toggle)
    
