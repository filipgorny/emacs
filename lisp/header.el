(defun header/display-header ()
  (if (not (string= (buffer-name (current-buffer)) " *NeoTree*"))
      (setq header-line-format
            '("" ;; invocation-name
              (:eval (buffer-file-name) :weight normal :background "111")))
    (progn
      (setq header-line-format '("" (:eval (concat "" projects/current-project-directory))))
      )))

(custom-set-faces '(header-line ((t :background "#111" :foreground "#aaa"))))


(add-hook 'buffer-list-update-hook
          'header/display-header)

