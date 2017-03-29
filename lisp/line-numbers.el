(global-linum-mode 1)
(custom-set-variables '(linum-format (quote " %3d ")))
(set-face-foreground 'linum "#1d1d13")
(set-face-background 'linum "#080805")
(set-face-bold 'linum nil)

(require-package 'hlinum)
(hlinum-activate)

(setq linum-highlight-in-all-buffersp t)

(set-face-background 'linum-highlight-face "#090905")
(set-face-foreground 'linum-highlight-face "#aaa")
