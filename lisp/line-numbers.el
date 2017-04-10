(global-linum-mode 1)
(custom-set-variables '(linum-format (quote " %3d ")))
(set-face-foreground 'linum "#332")
(set-face-background 'linum main-background-color)
(set-face-bold 'linum nil)

(require-package 'hlinum)
(hlinum-activate)

(setq linum-highlight-in-all-buffersp t)

(set-face-background 'linum-highlight-face "#141310")
(set-face-foreground 'linum-highlight-face "#aaa")
