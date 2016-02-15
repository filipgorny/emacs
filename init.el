(add-to-list 'load-path "~/.emacs.d/lisp")
(add-to-list 'load-path "~/.emacs.d/packages")


(require 'package);
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)

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
        (require-package package min-version t)))))
(package-initialize)

; theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'natural-vibration t)
(set-face-attribute 'vertical-border
                    nil
                    :foreground "#222222")
(set-face-attribute 'default nil :height 108 :family "Source Code Pro")
;;(set-face-attribute 'default nil :height 105 :family "DejaVu Sans Mono")
;;(set-face-attribute 'default nil :height 105 :family "Monospace")

;; global preferences
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(setq inhibit-startup-message t)
;; (if (not window-system) (menu-bar-mode -1))
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(require 'ido)
(ido-mode t)
(electric-pair-mode 1)
;(desktop-save-mode nil)
(set-fringe-mode 0)

;; line numbers
(global-linum-mode t)
(set-face-foreground 'linum "#303030")
(load "linum-current-number")
;;(setq linum-format " %3d  ")

; evil
(require-package 'evil)
(require 'evil)
(evil-mode t)
(setq evil-insert-state-cursor '((bar . 2) "#ffff00")
      evil-normal-state-cursor '(hbox "#88ff88")
      evil-visual-state-cursor '(box "#44ff44"))

; powerline
(require-package 'powerline)
(require 'powerline)
(require-package 'powerline-evil)
(require 'powerline-evil)
(powerline-evil-vim-theme)

;; side windows
(setq side-window-current-buffer nil)
(setq side-window nil)

(defun f-close-side-windows ()
    (progn
        (if side-window
                (delete-window side-window))
        (setq side-window nil)
        (setq side-window-current-buffer nil)))

(defun f-clear-side ()
    (progn
        (neotree-hide)
        (f-close-side-windows)))

(defun f-toggle-side-window (buffer)
    (interactive)
    (setq target-buffer (get-buffer buffer))
    (if (eq side-window-current-buffer target-buffer)
            (progn
                (f-close-side-windows)
                )
        (progn
            (f-clear-side)
            (split-window-right)
            (select-window (next-window))
            (switch-to-buffer buffer)
            (linum-mode -1)
            (setq side-window-current-buffer target-buffer)
            (setq side-window (selected-window))
            )
            ))

;; terminal
(setq system-uses-terminfo nil)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
;;(set-process-query-on-exit-flag (get-process "terminal<1>") nil)
(setq term-buffer nil)

(defun f-side-terminal-open ()
  "Create or visit a terminal buffer."
  (interactive)
  (if (not term-buffer)
      (progn
        (setq t-current-window (get-buffer-window (current-buffer)))
        (setq t-current-buffer (current-buffer))
        (setq term-buffer (generate-new-buffer "shell"))
        (shell term-buffer)
        (select-window t-current-window)
        (switch-to-buffer t-current-buffer)))
    (f-toggle-side-window term-buffer))


(global-set-key "\M-\d" 'f-side-terminal-open)

;; autocomplete
(require-package 'auto-complete)
(require 'auto-complete)
(ac-config-default)

;; syntax checking while typing
(require-package 'flycheck)
(require 'flycheck)
(require-package 'flymake-easy)
(require'flymake-easy)
(require-package 'flymake-jslint)
(require 'flymake-jslint)
(add-hook 'js-mode-hook 'flymake-jslint-load)
(require-package 'flymake-cursor)
(require 'flymake-cursor)
(custom-set-faces
`(flymake-errline
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,"#664444")
                   :foreground unspecified
                   :background unspecified
                   :inherit unspecified))
      (t (:foreground ,"#664444" :weight bold :underline t))))
   `(flymake-warnline
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,"#666644")
                   :foreground unspecified
                   :background unspecified
                   :inherit unspecified))
      (t (:forground ,"#666644" :weight bold :underline t))))
   `(flymake-infoline
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,"#446644")
                   :foreground unspecified
                   :background unspecified
                   :inherit unspecified))
      (t (:forground ,"#446644" :weight bold :underline t)))))


;; php support
(require-package 'php-mode)
(require 'php-mode)
(require-package 'php-extras)
(require 'php-extras)
(defface font-lock-sigil-face
  '((t (:foreground "#96cf00")))
  "Face to display sigils in.")
(font-lock-add-keywords 'php-mode
  '(("\\(\\$\\)[_a-zA-Z]" 1 'font-lock-sigil-face)))


;; exit to normal mode after saving buffer
(add-hook `before-save-hook
  (lambda ()
    (evil-normal-state)))

; force moving caret to beginning of the intentation
(require-package 'mwim)
(require 'mwim)
(global-set-key (kbd "<home>") 'mwim-beginning-of-code-or-line)
(global-set-key (kbd "<end>") 'mwim-end-of-code-or-line)

;; force insert mode when entering mini buffer
(add-hook 'minibuffer-setup-hook
  (lambda ()
    (evil-insert-state)))

; ido
(require 'ido)
(ido-mode t)

;; neotree
(require-package 'neotree)
(require 'neotree)
(setq neo-window-position 'right)
(setq neo-window-width 70)

(defun f-neotree-toggle ()
  "Toggle show the NeoTree window."
  (interactive)
  (f-close-side-windows)
  (if (neo-global--window-exists-p)
      (neotree-hide)
      (neotree-show)))

(global-set-key (kbd "M-q") 'f-neotree-toggle)
(global-set-key (kbd "C-q") 'f-toggle-neotree)

(add-hook 'neotree-mode-hook
    (lambda ()
        (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
      (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-enter)
      (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
      (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)))

; tabs
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

; switching buffers
(global-set-key (kbd "M--") 'previous-buffer)
(global-set-key (kbd "M-=") 'next-buffer)

; answer yes or no, changed to y-or-n (yes!!! for god sake yes)
(defalias 'yes-or-no-p 'y-or-n-p)

;; scrolling
(require-package 'smooth-scrolling)
(require 'smooth-scrolling)

(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time

;; javascript
(load "javascript")

;; highlight current line
(global-hl-line-mode 1)
(set-face-background 'hl-line "#222222")
(set-face-foreground 'highlight nil)

;; avoid esc key
(require-package 'key-chord)
(require 'key-chord)
(setq key-chord-two-keys-delay 0.5)
(key-chord-define evil-insert-state-map "jj" '(lambda ()
                                                (interactive)
                                                (evil-normal-state)
                                                (save-buffer)))
(key-chord-mode 1)
(global-set-key (kbd "C-x p") 'projectile-switch-project)
(global-set-key (kbd "C-x j") 'end-of-buffer)
(define-key evil-normal-state-map "\C-j"  'evil-window-down)
(define-key evil-normal-state-map "\C-k"  'evil-window-up)
(define-key evil-normal-state-map "\C-h"  'evil-window-left)
(define-key evil-normal-state-map "\C-l"  'evil-window-right)

;; mute bell
(setq ring-bell-function #'ignore)

;; Display file path in the title bar
(setq frame-title-format
      '((:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%b"))))

;; Highlight matching parentheses
(show-paren-mode t)

;; Backup and autosave files in temporary directory
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; web mode
(load "web-mode")
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.twig\\'" . web-mode))

;; typescript
(load "TypeScript")
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))
(require-package 'tss)
(require 'tss)
(tss-config-default)

;; projectile
(require-package 'projectile)
(require 'projectile)
(setq projectile-indexing-method 'native)
(setq projectile-switch-project-action 'neotree-projectile-action)
;;(setq neo-smart-open t) ;; neotree smart open

;; bajery
(setq visible-bell 1) ;; should blink instead of sounding
(add-hook 'before-save-hook 'delete-trailing-whitespace) ;; trail whitespace

;; indentation
(electric-indent-mode 1)
;;(require-package 'auto-indent-mode)
;;(require 'auto-indent-mode)
;;(auto-indent-global-mode)
;;(setq auto-indent-assign-indent-level 4) ; Changes the indent level to

;; saving last place
(require 'saveplace)
(setq-default save-place t)

;; tags
(require-package 'ggtags)
(require 'ggtags)
(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'php-mode 'c++-mode 'java-mode 'js-mode 'javascript-mode 'web-mode)
              (ggtags-mode 1))))
(global-set-key (kbd "<C-down-mouse-1>") 'ggtags-find-tag-mouse)
(global-set-key (kbd "<mouse-8>") 'previous-buffer)
(global-set-key (kbd "<drag-mouse-9>") 'next-buffer)
