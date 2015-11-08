(require 'package) ;; You might already have this line

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

(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

; theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'fruity-forest t)

; global preferences
(setq inhibit-startup-message t)
(menu-bar-mode -1)

; line numbers
(global-linum-mode t)
(setq linum-format "%d ")
(set-face-foreground 'linum "#151515")

; evil
(require-package 'evil)
(require 'evil)
(evil-mode t)
(require-package 'powerline)
(require 'powerline)
(require-package 'powerline-evil)
(require 'powerline-evil)
(powerline-evil-vim-theme)
