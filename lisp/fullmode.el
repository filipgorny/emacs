(defvar full-mode-initialized)

(defun full-mode ()
  (interactive)
  (if (not (boundp 'full-mode-initialized))
      (progn
	(setq full-mode/initialized t)
	(setq-default line-spacing 4)
	;;(set-face-attribute 'default nil :font "DejaVu Sans Mono" :height 110 :weight 'light)
	(set-face-attribute 'default nil :font "Source Code Pro" :height 107 :weight 'normal)
	(toggle-frame-maximized)
	(add-to-list 'default-frame-alist '(background-color . "#0a0a0a"))
	(add-to-list 'default-frame-alist '(background-color . "#0b0b0b"))
	(set-background-color "#181818")
	(set-foreground-color "#fefefe")
	(set-face-attribute 'fringe nil
			    :foreground (face-foreground 'default)
			    :background "1818181")
	(custom-set-faces '(linum ((t (:foreground "#4c4c4c" :background nil)))))
	(require 'hl-line)
	(hl-line-mode)
	(set-face-background hl-line-face "#1f1f1f")
	(global-hl-line-mode)
	(set-face-attribute 'vertical-border
			    nil
			    :foreground "#222222")
	(set-face-background 'modeline-inactive "#222222")
	(set-face-background 'mode-line "#444444")
	(set-face-attribute 'modeline-inactive nil :box nil)
	(set-face-attribute 'modeline-inactive nil :foreground "#333333")
	(set-face-attribute 'modeline-highlight nil :box nil)
	(set-face-attribute 'mode-line nil :height 100)
	(set-face-attribute 'mode-line nil :foreground "#000000")
	(set-face-attribute 'mode-line-inactive nil :height 100)

	(load "sidebar")
	(sidebar/open)
	
	(setq full-mode-initialized t)
	)
    )
  )

(global-set-key (kbd "M-RET") 'full-mode)
