;; common system properties
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; common properties for gui
(tool-bar-mode -1)
(menu-bar-mode -1)
(setq inhibit-startup-message t)
(setq ring-bell-function 'ignore)
(set-face-attribute 'fringe nil :background nil :foreground nil)
;; scroll one line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time

;; theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'natural-vibration t)
(set-face-attribute 'default nil :font "Hack" :height 110)
(set-face-attribute 'mode-line nil :box nil :height 110)
(set-face-background 'mode-line "#333")
(scroll-bar-mode -1)
(set-cursor-color "#ff3311")
(setq cursor-type '(bar . 6))
(set-face-attribute 'fringe nil
                      :foreground (face-foreground 'default)
                      :background (face-background 'default))
;; cua mode
(cua-mode t)
(setq cua-auto-tabify-rectangles nil) ;; Don't tabify after rectangle commands
(transient-mark-mode 1) ;; No region when it is not highlighted
(setq cua-keep-region-after-copy t) ;; Standard Windows behaviour

;; common keybindings
(global-set-key (kbd "C-d") 'kill-whole-line)
(defvar homerow-navigation-minor-mode-map
    (let ((map (make-sparse-keymap)))
        (define-key map (kbd "M-h") 'backward-char)
        (define-key map (kbd "M-j") 'next-line)
        (define-key map (kbd "M-k") 'previous-line)
        (define-key map (kbd "M-l") 'forward-char)
        (define-key map (kbd "M-d") 'end-of-line)
        (define-key map (kbd "M-a") 'beginning-of-line)
        (define-key map (kbd "M-s") 'back-to-indentation)
	(define-key map (kbd "M-=") 'next-buffer)
	(define-key map (kbd "M--") 'previous-buffer)
        map)
    "f-navigation-minor-mode keymap.")

(define-minor-mode homerow-navigation-minor-mode
    "A minor mode so that my key settings override annoying major modes."
    :init-value t
    :lighter "f-navigation")

(homerow-navigation-minor-mode 1)


;; packages
(require 'package)
(package-initialize)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)

;; libraries
(add-to-list 'load-path "~/.emacs.d/vendor/")

(load "sml-modeline.el")

(require 'linum)
(global-linum-mode)
(setq linum-format " %d")
(custom-set-variables '(linum-format (quote "%3d")))
(custom-set-faces '(linum ((t (:foreground "#333" :background nil)))))

