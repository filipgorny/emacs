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
(load-theme 'fruity-forest t)
(set-face-attribute 'vertical-border 
                    nil 
                    :foreground "#333333") 

; global preferences
(setq inhibit-startup-message t)
(menu-bar-mode -1)

; line numbers
(global-linum-mode t)
(setq linum-format "%d ")
(set-face-foreground 'linum "#222222")

; evil
(require-package 'evil)
(require 'evil)
(evil-mode t)
(require-package 'powerline)
(require 'powerline)
(require-package 'powerline-evil)
(require 'powerline-evil)
(powerline-evil-vim-theme)
(require-package 'neotree)
(require 'neotree)
(global-set-key (kbd "M-q") 'neotree-toggle)
;(add-to-list 'evil-emacs-state-modes 'nav-mode)
;(evil-set-initial-state 'nav-mode 'emacs)
;(define-key neotree-mode-map [return] 'neo-node-do-enter)
(add-hook 'neotree-mode-hook
	  (lambda ()
	    (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
	    (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-enter)
	    (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
            (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)))


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
