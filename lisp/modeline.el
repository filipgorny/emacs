(require-package 'powerline)
(add-to-list 'load-path "~/.emacs.d/vendor/emacs-powerline")

(custom-set-faces
 '(mode-line ((t (:foreground "#030303" :background "#bdbdbd" :box nil))))
 '(mode-line-inactive ((t (:foreground "#f9f9f9" :background "#666666" :box nil)))))

(powerline-default-theme)
