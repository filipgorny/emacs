(tool-bar-mode -1)
(menu-bar-mode -1)
(setq inhibit-startup-message t)

;; theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'natural-vibration t)

;; cua mode
(cua-mode t)
(setq cua-auto-tabify-rectangles nil) ;; Don't tabify after rectangle commands
(transient-mark-mode 1) ;; No region when it is not highlighted
(setq cua-keep-region-after-copy t) ;; Standard Windows behaviour

;; common keybindings
(global-set-key (kbd "C-d") 'kill-whole-line)
