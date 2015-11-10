(add-to-list 'load-path "~/.emacs.d/lisp")

(require 'package) ;
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
                    :foreground "#333333") 

; global preferences
(setq inhibit-startup-message t)
(menu-bar-mode -1)
(toggle-scroll-bar -1) 
(tool-bar-mode -1)

; line numbers
(global-linum-mode t)
(setq linum-format "%d ")
(set-face-foreground 'linum "#664444")

; evil
(require-package 'evil)
(require 'evil)
(evil-mode t)

; powerline
(require-package 'powerline)
(require 'powerline)
(require-package 'powerline-evil)
(require 'powerline-evil)
(powerline-evil-vim-theme)


(defun visit-term-buffer ()
  "Create or visit a terminal buffer."
  (interactive)
  (if (not (get-buffer "*ansi-term*"))
      (progn
        (split-window-sensibly (selected-window))
        (other-window 1)
        (ansi-term (getenv "SHELL")))
    (switch-to-buffer-other-window "*ansi-term*"))
    (progn
      (other-window -1)
      (kill-buffer "*ansi-term*" t)
    )
  )

(global-set-key (kbd "<f12>") 'visit-term-buffer) ; opening terminal window

; php support
(require-package 'php-mode)
(require 'php-mode)

; switching between windows
(global-set-key (kbd "C--") 'previous-buffer)
(global-set-key (kbd "C-=") 'next-buffer)

(defun prev-window ()
  (interactive)
  (other-window -1))

; enter normal mode when changin buffer
(add-hook `buffer-list-update-hook
  (lambda ()
   (evil-normal-state)))

; cursor color
(set-cursor-color "#ffffaa")

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

; force insert mode when entering mini buffer
(add-hook 'minibuffer-setup-hook
  (lambda ()
    (evil-insert-state)))

; file structure navigation
(require-package 'sr-speedbar)
(require 'sr-speedbar)
(global-set-key (kbd "M-q") 'sr-speedbar-toggle)
(eval-after-load 'sr-speedbar
    '(setq speedbar-hide-button-brackets-flag t
           speedbar-show-unknown-files t
           speedbar-smart-directory-expand-flag t
           speedbar-directory-button-trim-method 'trim
           speedbar-use-images nil
           speedbar-indentation-width 2
           speedbar-use-imenu-flag t
           sr-speedbar-width 40
           sr-speedbar-width-x 40
           sr-speedbar-auto-refresh nil
           sr-speedbar-skip-other-window-p t
           sr-speedbar-right-side nil))

