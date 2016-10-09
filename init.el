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

;; common system properties
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))
(tool-bar-mode -1)

;; maximized frame
(custom-set-variables
 '(initial-frame-alist (quote ((fullscreen . maximized)))))

;; subconfig files
(load "packaging")
(load "php")
(load "setup-hlm")

