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

;; global preferences
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(setq inhibit-startup-message t)
(menu-bar-mode -1)
(toggle-scroll-bar -1) 
(tool-bar-mode -1)
(require 'ido)
(ido-mode t)
(electric-pair-mode 1)

; line numbers
(global-linum-mode t)
(setq linum-format "%d ")
(set-face-foreground 'linum "#444444")

; evil
(require-package 'evil)
(require 'evil)
(evil-mode t)
(setq evil-insert-state-cursor '((bar . 5) "#ff5500")
      evil-normal-state-cursor '(box "#ffff55")
      evil-visual-state-cursor '(box "#44ff44"))

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

;; autocomplete
(require-package 'auto-complete)
(require 'auto-complete)
(ac-config-default)



;; syntax checking while typing
(require-package 'flycheck)
(require 'flycheck)

; php support
(require-package 'php-mode)
(require 'php-mode)
(require-package 'php-extras)
(require 'php-extras)

; switching between windows
(global-set-key (kbd "C--") 'previous-buffer)
(global-set-key (kbd "C-=") 'next-buffer)

(defun prev-window ()
  (interactive)
  (other-window -1))

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

;; force insert mode when entering mini buffer
(add-hook 'minibuffer-setup-hook
  (lambda ()
    (evil-insert-state)))

;; projecttile
(require-package 'projectile)
(require 'projectile)
(projectile-global-mode)

;; project explorer
(require-package 'neotree)
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(global-set-key (kbd "M-q") 'neotree-toggle)
;(global-set-key (kbd "M-q")
;		(lambda ()
;		  (if (neotree-opened)
;                    (lambda ()
;                      (setq neotree-opened nil)
;                      (pop-to-buffer (neo-global--get-buffer))
;		  (setq neotree-opened t)
;		  (neotree-toggle)))

(add-hook 'neotree-mode-hook
          (lambda ()
            (evil-insert-state)))
	      
;; tabbar
(require-package 'tabbar)
(require 'tabbar)
(tabbar-mode t)
(setq tabbar-background-color "#000000") ;; the color of the tabbar background
(custom-set-faces
 '(tabbar-default ((t (:inherit variable-pitch :background "#000000" :foreground "#444444" :weight bold))))
 '(tabbar-button ((t (:inherit tabbar-default :foreground "dark red"))))
 '(tabbar-button-highlight ((t (:inherit tabbar-default))))
 '(tabbar-highlight ((t (:underline t))))
 '(tabbar-selected ((t (:inherit tabbar-default :background "#000000" :foreground "#888877"))))
 '(tabbar-separator ((t (:inherit tabbar-default :background "#222222"))))
 '(tabbar-unselected ((t (:inherit tabbar-default)))))
(global-set-key (kbd "M--") 'tabbar-backward-tab)
(global-set-key (kbd "M-=") 'tabbar-forward-tab)

;;
;; Change padding of the tabs
;; we also need to set separator to avoid overlapping tabs by highlighted tabs
(custom-set-variables
 '(tabbar-separator (quote (0.5))))
;; adding spaces
(defun tabbar-buffer-tab-label (tab)
  "Return a label for TAB.
That is, a string used to represent it on the tab bar."
  (let ((label  (if tabbar--buffer-show-groups
                    (format "[%s]  " (tabbar-tab-tabset tab))
                  (format "%s  " (tabbar-tab-value tab)))))
    ;; Unless the tab bar auto scrolls to keep the selected tab
    ;; visible, shorten the tab label to keep as many tabs as possible
    ;; in the visible area of the tab bar.
    (if tabbar-auto-scroll-flag
        label
      (tabbar-shorten
       label (max 1 (/ (window-width)
                       (length (tabbar-view
                                (tabbar-current-tabset)))))))))

(tabbar-mode 1)


(defadvice tabbar-buffer-tab-label (after fixup_tab_label_space_and_flag activate)
   (setq ad-return-value
         (if (and (buffer-modified-p (tabbar-tab-value tab))
                  (buffer-file-name (tabbar-tab-value tab)))
             (concat " + " (concat ad-return-value " "))
           (concat " " (concat ad-return-value " ")))))
(defun ztl-modification-state-change ()
   (tabbar-set-template tabbar-current-tabset nil)
   (tabbar-display-update))
(defun ztl-on-buffer-modification ()
   (set-buffer-modified-p t)
   (ztl-modification-state-change))
(add-hook 'after-save-hook 'ztl-modification-state-change)
(add-hook 'first-change-hook 'ztl-on-buffer-modification)


