(defun header/display-header ()
  (if (not (string= (buffer-name (current-buffer)) " *NeoTree*"))
      (setq header-line-format
            '("" ;; invocation-name
              (:eval (last (split-string (buffer-file-name) "/")) :weight normal)))
    (progn
                                        ;(setq header-line-format '("" (:eval (concat "" (if (not projects/current-project-directory))))
      (if (boundp 'projects/current-project-directory) ;
          projects/current-project-directory
                                        "no project")
      
      )))

(custom-set-faces '(header-line ((nil :background "#111" :foreground "#eec" :weight bold))))

;; (add-hook 'buffer-list-update-hook
;;           'header/display-header)

;; (add-hook 'neotree-mode-hook
;;           'header/display-header)
