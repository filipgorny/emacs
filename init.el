;; packages
(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t) ; Org-mode's repository
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(defun require-package (package &optional min-version no-refresh)
  "Install given PACKAGE, optionally requiring MIN-VERSION.
If NO-REFRESH is non-nil, the available package lists will not be
jre-downloaded in order to locate PACKAGE."
  (if (package-installed-p package min-version)
      (if (or (assoc package package-archive-contents) no-refresh)
	  (progn
	    ;;(package-refresh-contents)
	    (package-install package))
      (progn
          (package-refresh-contents)
          (require-package package min-version t))))
   (require package))

;; common system properties
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; empty scratch
(setq initial-scratch-message "")

;; libraries
(add-to-list 'load-path "~/.emacs.d/vendor/")
(add-to-list 'load-path "~/.emacs.d/lisp/")

;; header line
(setq header-title-format
      (list (format "%s %%S: %%j " (system-name))
       '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))
(set-face-background 'header-line "#151515")

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
(set-face-background 'mode-line "#151515")
(set-face-foreground 'mode-line "#444")
(scroll-bar-mode -1)
(set-cursor-color "#ff3311")
(set-face-attribute 'fringe nil
                      :foreground (face-foreground 'default)
                      :background (face-background 'default))

(set-face-attribute 'vertical-border
                     nil
                     :foreground "#232323")

;; modern key shortcuts
(cua-mode t)
(setq cua-auto-tabify-rectangles nil) ;; Don't tabify after rectangle commands
(transient-mark-mode 1) ;; No region when it is not highlighted
(setq cua-keep-region-after-copy t) ;; Standard Windows behaviour
(global-set-key (kbd "C-s") 'save-buffer)
(global-set-key (kbd "C-f") 'isearch-forward)
(define-key isearch-mode-map "\C-f" 'isearch-repeat-forward)

;; autocomplete
(require-package 'auto-complete)
(ac-config-default)

;; common keybindings
(global-set-key (kbd "C-x j") 'end-of-buffer)
(global-set-key (kbd "C-a") 'mark-whole-buffer)
(global-set-key (kbd "C-d") 'kill-whole-line)
(defvar homerow-navigation-minor-mode-map
    (let ((map (make-sparse-keymap)))
      (define-key map (kbd "M-h") 'backward-char)
        (define-key map (kbd "M-j") 'next-line)
        (define-key map (kbd "M-k") '(lambda ()
				       (interactive)
				       (previous-line)))
				       ;; (indent-according-to-mode)))
        (define-key map (kbd "M-l") 'forward-char)
        (define-key map (kbd "M-d") 'end-of-line)
        (define-key map (kbd "M-a") 'beginning-of-line)
        (define-key map (kbd "M-s") 'back-to-indentation)
	(define-key map (kbd "M-=") 'next-buffer)
	(define-key map (kbd "M--") 'previous-buffer)
	(define-key map (kbd "M-u") '(lambda () (scroll-down 20)))
	(define-key map (kbd "M-i") '(lambda () (scroll-up 20)))
	(define-key map (kbd "M-w") '(lambda () (forward-word)))
        map)
    "homerow-navigation-minor-mode keymap.")

(define-minor-mode homerow-navigation-minor-mode
  "A minor mode so that my key settings override annoying major modes."
  :init-value t
  :lighter "homerow-navigation")

(homerow-navigation-minor-mode 1)

;; line numbers
(require 'linum)
(global-linum-mode)
(if (window-system)
    (progn
      (custom-set-variables '(linum-format (quote "%4d ")))
      (custom-set-faces '(linum ((t (:foreground "#223" :background nil))))))
  (progn
    (custom-set-variables '(linum-format (quote "%4d ")))
    (custom-set-faces '(linum ((t (:foreground "#333" :background nil)))))))
(ac-linum-workaround)

;; fringe
(fringe-mode -1)

;; rainbow delimeters
(require-package 'rainbow-delimiters)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(linum ((t (:foreground "#223" :background nil))))
 '(rainbow-delimiters-depth-1-face ((t (:foreground "#ddee00"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "#ccdd00"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "#bbaa00"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "#aa9900"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "#997700"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "#885500"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "#774400"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "#663300"))))
 '(rainbow-delimiters-depth-9-face ((t (:foreground "#552200"))))
 '(rainbow-delimiters-unmatched-face ((t (:foreground "red"))))
 '(show-paren-match ((((class color) (background light)) (:background "azure2"))))
 '(term ((t (:background "#000000" :foreground "#fdfdfd")))))

;; helm
(require-package 'helm)
(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") #'helm-find-files)
(helm-mode 1)
(defun fu/helm-find-files-navigate-forward (orig-fun &rest args)
  (if (file-directory-p (helm-get-selection))
      (apply orig-fun args)
    (helm-maybe-exit-minibuffer)))
(advice-add 'helm-execute-persistent-action :around #'fu/helm-find-files-navigate-forward)
(define-key helm-find-files-map (kbd "<return>") 'helm-execute-persistent-action)
(defun fu/helm-find-files-navigate-back (orig-fun &rest args)
  (if (= (length helm-pattern) (length (helm-find-files-initial-input)))
      (helm-find-files-up-one-level 1)
    (apply orig-fun args)))
(advice-add 'helm-ff-delete-char-backward :around #'fu/helm-find-files-navigate-back)
(defadvice helm-display-mode-line (after undisplay-header activate)
  (setq header-line-format nil))

;; emacs restarting
(require-package 'restart-emacs)
(global-set-key (kbd "C-9") 'restart-emacs)

;; frame format
(setq frame-title-format
      '("%S" (buffer-file-name "%f"
                   (dired-directory dired-directory "%b"))))

;; org mode
(setq org-src-fontify-natively t)

;; popwin
(require-package 'popwin)
(popwin-mode 1)

;; showparen mode
(require 'paren)
(show-paren-mode 1)
(set-face-background 'show-paren-match (face-background 'default))
(set-face-foreground 'show-paren-match "#0f0")
(set-face-attribute 'show-paren-match nil :weight 'extra-bold :underline t)

;; recent files
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key (kbd "C-x C-r") 'helm-recentf)

;; vendors
(load "yaml-mode")

;; own plugins
;;(load "sidebar")
(load "fullmode")
(load "php")
(load "python-lang")
(load "savenote")
(load "rename")
(load "commenting")
