;(require-package 'powerline)
;(add-to-list 'load-path "~/.emacs.d/vendor/emacs-powerline")

(custom-set-faces
 '(mode-line ((t (:foreground "#eee" :background "#111" :box nil))))
 '(mode-line-inactive ((t (:foreground "#eee" :background "#111" :box nil)))))

;(powerline-default-theme)

(setq-default mode-line-format '((:eval (buffer-file-name))))

;; (setq mode-line-format
;;       '((:eval (simple-mode-line-render
;;                 ;; left
;;                 (format-mode-line "%b [%m] [%*]")
;;                 ;; right
;;                 (format-mode-line "Line: %l/%i Column: %c")))))
