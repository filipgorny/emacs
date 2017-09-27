(setq mood-theming/background-default (face-attribute 'default :background))

(setq mood-theming/color-relaxed "#151505")
(setq mood-theming/color-relaxed "#1d2a06")

(defun mood-theming/update-background (color)
  (set-face-background 'default color)
  (set-face-background 'fringe color)
  (set-face-background 'linum color))

(defun mood-theming/set-background-default ()
  (interactive)
  (global-hl-line-mode 1)
  (mood-theming/update-background mood-theming/background-default))

(defun mood-theming/set-background-relaxed ()
  (interactive)
  (global-hl-line-mode 0)
  (mood-theming/update-background mood-theming/color-relaxed))

(defun mod-theming/generate-color ()
  (let*
      ((r ((random 100) * 255 / 4))
       (g ((random 100) * 255 / 4))
       (b ((random 100) * 255 / 4)))
  )
