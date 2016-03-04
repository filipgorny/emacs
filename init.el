(add-to-list 'load-path "~/.emacs.d/lisp")
(add-to-list 'load-path "~/.emacs.d/packages")
(add-to-list 'load-path "~/.emacs.d/vendor")

(require 'package);
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
        (require-package package min-version t)))))
(package-initialize)

; theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'natural-vibration t)
(set-face-attribute 'vertical-border
                    nil
                    :foreground "#222222")
(set-face-attribute 'default nil :height 110 :family "Source Code Pro" :weight 'normal)
;;(set-face-attribute 'default nil :height 112 :family "Roboto Mono" :embolden t)
;; (set-face-attribute 'default nil :height 110 :family "Monospace")
;; (set-default-font "DejaVu Sans Mono 11")
;;(custom-set-faces '(default ((t (:height 110 :family "DejaVu Sans Mono" :embolden t)))))
(set-default 'line-spacing 4)

;; global preferences
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(setq inhibit-startup-message t)
(menu-bar-mode -1   )
(toggle-scroll-bar -1)
(tool-bar-mode -1)
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
            (set-window-margins nil 1)
            )
            ))

;; autocomplete
(require-package 'auto-complete)
(require 'auto-complete)
(ac-config-default)
(load "auto-complete-etags.el")
(ac-linum-workaround)

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
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flymake-errline ((((supports :underline (:style wave))) (:underline (:style wave :color "#664444") :foreground unspecified :background unspecified :inherit unspecified)) (t (:foreground "#664444" :weight bold :underline t))))
 '(flymake-infoline ((((supports :underline (:style wave))) (:underline (:style wave :color "#446644") :foreground unspecified :background unspecified :inherit unspecified)) (t (:forground "#446644" :weight bold :underline t))))
 '(flymake-warnline ((((supports :underline (:style wave))) (:underline (:style wave :color "#666644") :foreground unspecified :background unspecified :inherit unspecified)) (t (:forground "#666644" :weight bold :underline t)))))


;; php support
(load "php")

;; javascript support
(load "javascript")

;; exit to normal mode after saving buffer
(add-hook `before-save-hook
  (lambda ()
    (evil-normal-state)))

;; force moving caret to beginning of the intentation
(require-package 'mwim)
(require 'mwim)
(global-set-key (kbd "<home>") 'mwim-beginning-of-code-or-line)
(global-set-key (kbd "<end>") 'mwim-end-of-code-or-line)

;; force insert mode when entering mini buffer
(add-hook 'minibuffer-setup-hook
  (lambda ()
    (evil-insert-state)))

;; neotree
(require-package 'neotree)
(require 'neotree)
(setq neo-window-position 'right)
(setq neo-window-width 60)

(defun f-neotree-toggle ()
  "Toggle show the NeoTree window."
  (interactive)
  (f-close-side-windows)
  (if (neo-global--window-exists-p)
      (neotree-hide)
      (neotree-show)))

(add-hook 'neotree-mode-hook
          (lambda ()
              (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
      (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-enter)
      (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
      (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)
      (message "neotree opened")
      (set-window-margins nil 4)))

; tabs
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

                                        ; answer yes or no, changed to y-or-n (yes!!! for god sake yes)
(defalias 'yes-or-no-p 'y-or-n-p)

;; scrolling
(require-package 'smooth-scrolling)
(require 'smooth-scrolling)

(setq mouse-wheel-scroll-amount '(2 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time

(setq redisplay-dont-pause t
  scroll-margin 1
  scroll-conservatively 10000
  scroll-preserve-screen-position 1)

;; javascript
(load "javascript")

;; highlight current line
(global-hl-line-mode 1)
(set-face-background 'hl-line "#141414")
(set-face-foreground 'highlight nil)


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
(add-to-list 'auto-mode-alist '("\\.css\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.twig\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.hs\\'" . web-mode))
(setq web-mode-enable-current-element-highlight t)
(setq web-mode-enable-auto-pairing t)
(setq web-mode-enable-css-colorization t)
(setq web-mode-enable-block-face t)
        (setq web-mode-enable-current-element-highlight t)
(load "html")

;; typescript
(load "TypeScript")
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))
(require-package 'tss)
(require 'tss)
(tss-config-default)

;; projectts management
(require-package 'projectile)
(require 'projectile)
(projectile-global-mode)
(setq projectile-indexing-method 'alien)
(setq projectile-switch-project-action 'neotree-projectile-action)
(setq projectile-remember-window-configs t)

;; bajery
(setq visible-bell 1) ;; should blink instead of sounding
(add-hook 'before-save-hook 'delete-trailing-whitespace) ;; trail whitespace

;; indentation
(electric-indent-mode nil)
(require-package 'auto-indent-mode)
(require 'auto-indent-mode)
(auto-indent-global-mode)
(setq auto-indent-assign-indent-level 4) ; Changes the indent level to
(setq auto-indent-disabled-modes-list (list 'shell-mode))

;; save cursor position
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
;;(global-set-key (kbd "<C-mouse-1>") 'ggtags-find-tag-mouse)
(global-set-key (kbd "<mouse-8>") 'previous-buffer)
(global-set-key (kbd "<drag-mouse-9>") 'next-buffer)
(setq ggtags-completing-read-function nil)

;; ido
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;; avoid esc key
(require-package 'key-chord)
(require 'key-chord)
(setq key-chord-two-keys-delay 0.2)
(key-chord-define evil-insert-state-map "jj" '(lambda ()
                                                (interactive)
                                                (evil-normal-state)))
(key-chord-mode 1)
(global-set-key (kbd "C-x p") 'projectile-switch-project)
(global-set-key (kbd "C-x j") 'end-of-buffer)
(define-key evil-normal-state-map "\C-j"  'evil-window-down)
(define-key evil-normal-state-map "\C-k"  'evil-window-up)
(define-key evil-normal-state-map "\C-h"  'evil-window-left)
(define-key evil-normal-state-map "\C-l"  'evil-window-right)

(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "C-y") 'redo)
(define-key evil-normal-state-map "\C-z"  'undo)
(define-key evil-normal-state-map "\C-y"  'redo)
(define-key evil-insert-state-map "\C-z"  '(lambda ()
                                             (interactive)
                                             (undo)
                                             (evil-normal-state)))
(define-key evil-insert-state-map "\C-y"  'redo)

;; restart emacs
(require-package 'restart-emacs)
(require 'restart-emacs)

;; powerline
(require-package 'smart-mode-line)
(require 'smart-mode-line)
(require-package 'smart-mode-line-powerline-theme)
(setq sml/no-confirm-load-theme t)
(sml/setup)
(sml/apply-theme 'powerline)
(custom-theme-set-faces
 'smart-mode-line-powerline
 '(mode-line-inactive ((((background dark)) :foreground "gray60" :background "Black"
                          :slant italic)
                         (((background light)) :foreground "gray60" :background "Black"
                          :slant italic))))

;; snippets
(load "snippets")

;; org mode
(load "org-assistant")
(load "org-mouse")

;; perspective
(require-package 'perspective)
(require 'perspective)
(persp-mode)

;; transparency
(set-frame-parameter (selected-frame) 'alpha '(98 98))
(add-to-list 'default-frame-alist '(alpha 98 98))

;; custom common keybindings
(load "keybindings")

;; disable backup autosaves
(setq make-backup-files nil)

;; auto save on lost focus
(defun save-all ()
    (interactive)
        (message "Autosaving after focus out...")
        (save-some-buffers t))

(add-hook 'focus-out-hook 'save-all)

;; terminal colors
(load "f-shell")

;; color brackets
(require-package 'rainbow-delimiters)
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
(custom-set-faces
 '(rainbow-delimiters-depth-1-face ((t (:foreground "#ffaa00"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "#99ff99"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "#aa88ff"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "#88ffff"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "#88ff00"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "#ffff66"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "#44ff44"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "#22ff22"))))
 '(rainbow-delimiters-depth-9-face ((t (:foreground "#00ff00"))))
 '(rainbow-delimiters-unmatched-face ((t (:foreground "red"))))
 '(show-paren-match ((((class color) (background light)) (:background "azure2")))))

;; navitation between windows and buffers
(load "navigation")

;; indentation guide lines

;; auto pair
(require-package 'autopair)
(require 'autopair)
(autopair-global-mode)

; Override the default x-select-text function because it doesn't
; respect x-select-enable-clipboard on OS X.
(defun x-select-text (text))
(setq x-select-enable-clipboard nil)
(setq x-select-enable-primary nil)
(setq mouse-drag-copy-region nil)
