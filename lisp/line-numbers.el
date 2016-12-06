(global-linum-mode 1)
(custom-set-variables '(linum-format (quote " %3d ")))
(set-face-foreground 'linum "#414141")
(set-face-background 'linum "#191919")
(set-face-bold 'linum nil)

(require-package 'hlinum)
(hlinum-activate)

(setq linum-highlight-in-all-buffersp t)

(set-face-background 'linum-highlight-face "#222")
(set-face-foreground 'linum-highlight-face "#aa9900")
