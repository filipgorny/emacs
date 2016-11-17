;; hide welcome screen

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq inhibit-startup-screen t)

;; cua mode
(cua-mode t)

;; load common lisp
(require 'cl)

;; define load paths
(add-to-list 'load-path "~/.emacs.d/lisp")
(add-to-list 'load-path "~/.emacs.d/themes")
(add-to-list 'load-path "~/.emacs.d/vendor")
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;; package loader
(load "packaging")

;; theme
(load "natural-vibration-theme")
(scroll-bar-mode -1)

;; turn off alarm bell
(setq ring-bell-function 'ignore)

;; saving session
;;(desktop-save-mode nil)

;; common system properties
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))
(tool-bar-mode -1)

;; maximized frame
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(package-selected-packages
   (quote
    (project-explorer yaml-mode workgroups twig-mode tabbar smartparens php-auto-yasnippets perspective js3-mode highlight-parentheses helm-projectile flymake-php ac-php))))

;; yasnippet
;(require-package 'yasnippet)
;(yas-global-mode 1)

;; parentheses
(require-package 'smartparens)
(smartparens-global-mode t)
(require-package 'highlight-parentheses)
(highlight-parentheses-mode)

;; whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; subconfig files
(setq configs '(
      "packaging"
      "autocomplete"
      "php"
      "setup-hlm"
      "homerow-navigation"
      "projects"
      "cursor"
      "recent-files"
      ))

(cl-loop for config in configs
	 collect (load config))
