(custom-set-faces
 '(web-mode-html-tag-face
   ((t (:foreground "#ffa000" :weight bold))))
 '(web-mode-html-tag-bracket-face
   ((t (:foreground "#ee7000"))))
 '(web-mode-current-element-highlight-face
   ((t (:background "#222222"
                    :foreground "#ff2222"))))
 '(web-mode-html-attr-name-face
   ((t (:foreground "#fafe00"))))
 '(web-mode-html-attr-value-face
   ((t (:foreground "#ffaaaa")))))

(defun nemis/bind-web-mode-keys ()
    (define-key evil-normal-state-map (kbd "SPC") 'web-mode-fold-or-unfold)
    (define-key evil-normal-state-map (kbd "C-SPC") 'web-mode-element-select))


(add-hook 'web-mode-hook 'nemis/bind-web-mode-keys)
