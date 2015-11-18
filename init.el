(add-to-list 'load-path "~/.emacs.d/lisp")

(require 'package);
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
(set-face-attribute 'default nil :height 105 :family "Source Code Pro")

;; global preferences
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(setq inhibit-startup-message t)
(if (not window-system) (menu-bar-mode -1))
(toggle-scroll-bar -1) 
(tool-bar-mode -1)
(require 'ido)
(ido-mode t)
(electric-pair-mode 1)
;(desktop-save-mode nil)
(set-fringe-mode 0)

; line numbers
(global-linum-mode t)
(setq linum-format "%d ")
(set-face-foreground 'linum "#282828")

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

;(defun visit-term-buffer ()
;  "Create or visit a terminal buffer."
;  (interactive)
;  (if (not (get-buffer "*ansi-term*"))
;      (lambda () 
;        (split-window-sensibly (selected-window))
;        (othe-window 1)
;        (ansi-term (getenv "SHELL"))
;        (switch-to-buffer-other-window "*ansi-term*"))
;    (lambda ()
;      (other-window -1)
;      (kill-buffer "*ansi-term*" t)))

(global-set-key (kbd "<f12>") 'visit-term-buffer) ; opening terminal window

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

; php support
(require-package 'php-mode)
(require 'php-mode)
(require-package 'php-extras)
(require 'php-extras)

; exit to normal mode after saving buffer
(add-hook `before-save-hook
  (lambda ()
    (evil-normal-state)))

; force moving caret to beginning of the intentation
(require-package 'mwim)
(require 'mwim)
(global-set-key (kbd "<home>") 'mwim-beginning-of-code-or-line)
(global-set-key (kbd "<end>") 'mwim-end-of-code-or-line)

; relative line numbers
(require-package 'linum-relative)
(require 'linum-relative)
(linum-relative-on)

;; force insert mode when entering mini buffer
(add-hook 'minibuffer-setup-hook
  (lambda ()
    (evil-insert-state)))

;; projecttile
(require-package 'projectile)
(require 'projectile)
(projectile-global-mode)

; remove annoying messages
;(load "nodesktopsaveorsessionwarning")

; ido
(require 'ido)
(ido-mode t)

; neotree
(require-package 'neotree)
(require 'neotree)
(setq navigation-opened nil)

(defun toggle-neotree ()
  (interactive)
  (if navigation-opened
      (progn
        (if (string= (buffer-name (current-buffer)) (buffer-name (neo-global--get-buffer)))
            (progn
              (neotree-hide)
              (setq navigation-opened nil))
           (switch-to-buffer-other-window (neo-global--get-buffer))))
    (progn
      (neotree-toggle)
      (setq navigation-opened t))))

(global-set-key (kbd "C-e") 'toggle-neotree)
(global-set-key (kbd "M-q") 'toggle-neotree)
(global-set-key [F8] 'toggle-neotree)
(add-hook 'neotree-mode-hook
    (lambda ()
      (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
      (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-enter)
      (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
      (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)))
(setq projectile-switch-project-action 'neotree-projectile-action)

; tabs
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

; switching buffers
(global-set-key (kbd "M--") 'previous-buffer)
(global-set-key (kbd "M-=") 'next-buffer)

; answer yes or no, changed to y-or-n (yes!!! for god sake yes)
(defalias 'yes-or-no-p 'y-or-n-p)
