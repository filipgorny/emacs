(setq-default line-spacing 4)
;;(set-face-attribute 'default nil :font "DejaVu Sans Mono" :height 110 :weight 'light)

(set 'full-mode-background-color "#0d0d0d")
(set 'full-mode-foreground-color "#fafafa")

(set-cursor-color "#ffff00")
(setq-default cursor-type 'bar)
(blink-cursor-mode 1)

(set-face-attribute 'default nil :font "Source Code Pro" :height 104 :weight 'normal)
(add-to-list 'default-frame-alist '(background-color . full-mode-background-color))
(add-to-list 'default-frame-alist '(background-color . full-mode-background-color))
(set-background-color full-mode-background-color)
(set-foreground-color full-mode-foreground-color)
(global-hl-line-mode 1)

(set-face-attribute 'fringe nil
		    :foreground (face-foreground 'default)
		    :background full-mode-background-color)

(custom-set-faces '(linum ((t (:foreground "#292929" :background nil)))))
(set-face-attribute 'vertical-border
		    nil
		    :foreground "#202020")
(set-face-background 'modeline-inactive "#191919")
(set-face-background 'mode-line "#1d1d1d")
(set-face-attribute 'modeline-inactive nil :box nil)
(set-face-attribute 'modeline-inactive nil :foreground "#666666")
(set-face-attribute 'modeline-highlight nil :box t)
(set-face-attribute 'mode-line nil :box nil)
(set-face-attribute 'mode-line nil :height 90)
(set-face-attribute 'mode-line nil :foreground "#9a9a92")
(set-face-attribute 'mode-line-inactive nil :height 90)

(set-face-background 'hl-line "#111111")

