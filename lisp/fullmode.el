(defvar full-mode-initialized)

(defun full-mode ()
  (interactive)
  (if (not (boundp 'full-mode-initialized))
      (progn
	(setq full-mode/initialized t)

	(load "fullmode_theme")
	(load "projects")
	(load "highlight_current_line")
	(load "terminal")

	(setq projectile-switch-project-action 'sidebar/goto-project-root)

	(defun full-mode/init-sidebar (neotree-sidebar)
	  (if neotree-sidebar
	      (progn
		(load "neotree-sidebar")
		(neotree-show))
	    (progn
	      (load "sidebar")
	      (sidebar/open))))
	
	(full-mode/init-sidebar t)

	;; helm changes
	(setq helm-split-window-in-side-p t
	      helm-move-to-line-cycle-in-source t
	      helm-scroll-amount 6)
	
	(setq full-mode-initialized t)
	)
    )
  )

(global-set-key (kbd "M-RET") 'full-mode)
