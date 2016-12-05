(global-linum-mode 1)
(custom-set-variables '(linum-format (quote " %3d ")))
(set-face-foreground 'linum "#313131")
(set-face-bold 'linum t)

(require-package 'hlinum)
(hlinum-activate)

(setq linum-highlight-in-all-buffersp t)

(set-face-background 'linum-highlight-face "#181818")
(set-face-foreground 'linum-highlight-face "#aa9900")
