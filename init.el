;; packages
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))

(defun require-package (package &optional min-version no-refresh)
  "Install given PACKAGE, optionally requiring MIN-VERSION.
If NO-REFRESH is non-nil, the available package lists will not be
re-downloaded in order to locate PACKAGE."
  (if (package-installed-p package min-version)
          t
      (if (or (assoc package package-archive-contents) no-refresh)
              (package-install package)
      (progn
          (package-refresh-contents)
          (require-package package min-version t))))
  (require package))

(package-initialize)

;; common system properties
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; empty scratch
(setq initial-scratch-message "")

;; libraries
(add-to-list 'load-path "~/.emacs.d/vendor/")

(load "header")

;; common properties for gui
(tool-bar-mode -1)
(menu-bar-mode -1)
(setq inhibit-startup-message t)
(setq ring-bell-function 'ignore)
(set-face-attribute 'fringe nil :background nil :foreground nil)
;; scroll one line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(2 ((shift) . 2))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time

;; theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'natural-vibration t)
(set-face-attribute 'default nil :font "Hack" :height 110)
(set-face-attribute 'mode-line nil :box nil :height 110)
(set-face-background 'mode-line "#223")
(set-face-foreground 'mode-line "#769")
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

;; autocomplete
(require-package 'auto-complete)

;; common keybindings
(defun jump-notspecial-buffer (direction)
  (if (> direction 0)
      (switch-to-next-buffer)
    (switch-to-prev-buffer))
  (while (string= (substring (buffer-name) 0 1) "*")
    (if (> direction 0)
	(switch-to-next-buffer)
      (switch-to-prev-buffer)
      ))
  )

(defun previous-notspecial-buffer ()
  (jump-notspecial-buffer -1)
  )

(defun next-notspecial-buffer ()
  (jump-notspecial-buffer 1)
  )

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
	(define-key map (kbd "M-=") 'next-notspecial-buffer)
	(define-key map (kbd "M--") 'previous-notspecial-buffer)
        map)
    "f-navigation-minor-mode keymap.")

(define-minor-mode homerow-navigation-minor-mode
    "A minor mode so that my key settings override annoying major modes."
    :init-value t
    :lighter "homerow-navigation")

(homerow-navigation-minor-mode 1)

(global-set-key (kbd "M-RET") 'toggle-max-frame)

;; line numbers
(require 'linum)
(global-linum-mode)
(setq linum-format " %d")
(custom-set-variables '(linum-format (quote "%3d")))
(custom-set-faces '(linum ((t (:foreground "#223" :background nil)))))

;; rainbow delimeters
(require-package 'rainbow-delimiters)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
(custom-set-faces
 '(rainbow-delimiters-depth-1-face ((t (:foreground "#ffaa00"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "#99ff99"))))
 '(rainbow-delimiters-depth-3-face ((t (:foregrjjound "#aa88ff"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "#88ffff"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "#88ff00"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "#ffff66"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "#44ff44"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "#22ff22"))))
 '(rainbow-delimiters-depth-9-face ((t (:foreground "#00ff00"))))
 '(rainbow-delimiters-unmatched-face ((t (:foreground "red"))))
 '(show-paren-match ((((class color) (background light)) (:background "azure2")))))

;; helm
(require-package 'helm)
(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") #'helm-find-files)
(helm-mode 1)


