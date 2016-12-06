(package-initialize)

;; hide welcome screen
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
(setq-default line-spacing 6)
(global-hl-line-mode 1)
(set-face-background 'hl-line "#1b1b1b")
;;(set-face-attribute 'default (selected-frame) :height 95 :family "DejaVu Sans Mono")
(set-frame-font "DejaVu Sans Mono-9.5")
;;(set-face-attribute 'default nil :family "Inconsolata" :height 100)

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
(menu-bar-mode -1)

;; maximized frame
(custom-set-variables
 '(initial-frame-alist (quote ((fullscreen . maximized)))))

;; yasnippet
;(require-package 'yasnippet)
;(yas-global-mode 1)

;; whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; scrolling
(progn
  (setq mouse-wheel-scroll-amount '(3 ((shift) . 3))) ;; scroll speed
  (setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
  (setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
  (setq scroll-step 3) ;; keyboard scroll "speed"
)

;; subconfig files
(setq configs '(
		"common"
		"packaging"
		"line-numbers"
		"autocomplete"
		"php"
		"setup-hlm"
		"homerow-navigation"
		"projects"
		"cursor"
		"recent-files"
		"brackets"
		"modeline"
		"sidebar"
		"highlight-symbol"
		"terminal"
		"orgmode"
		"organizer"
		"notes"
		"buffers-and-files-navigation"
		"indentation"
		))

(cl-loop for config in configs
	 collect (load config))
