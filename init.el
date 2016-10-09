;; hide welcome screen
(setq inhibit-startup-screen t)

;; cua mode
(cua-mode t)

;; define load paths
(add-to-list 'load-path "~/.emacs.d/lisp")
(add-to-list 'load-path "~/.emacs.d/themes")
(add-to-list 'load-path "~/.emacs.d/vendor")

;; load dark theme
(load "natural-vibration-theme")

;; turn off alarm bell
(setq ring-bell-function 'ignore)

;; languages support
(load "php")
