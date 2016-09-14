(defvar full-mode-initialized)

(defun full-mode ()
  (interactive)
  (if (not (boundp 'full-mode-initialized))
      (progn
	(setq full-mode/screen-window (selected-window))
	(setq full-mode/initialized t)

	(load "highlight_current_line")
	(load "fullmode_theme")
	(load "projects")
	(load "terminal")
	;; (load "javascript")
	(load "fullmode/helm")

	(setq screen-window (selected-window))
	
	(defun full-mode/init-sidebar (neotree-sidebar)
	  (if neotree-sidebar
	      (progn
		(load "neotree-sidebar")
		(neotree-show)
		(add-hook 'project-switch-hook (lambda ()
						 (neotree-dir (projectile-project-root))
						 (f-sidebar-toggle-focus))))
	    (progn
	      (load "sidebar")
	      (add-hook 'project-switch-hook (lambda ()
					       (sidebar/goto-project-root)))
	      (sidebar/open))))
	
	(full-mode/init-sidebar t)

	;; helm changes
	(setq helm-split-window-in-side-p t
	      helm-move-to-line-cycle-in-source t
	      helm-scroll-amount 6)
	
	(setq full-mode-initialized t)

	(select-window full-mode/screen-window)

	;; auto close brackets
	(electric-pair-mode t)

	;; auto indent
	(electric-indent-mode 1)

	(toggle-frame-maximized)
	)
    )
  )

(global-set-key (kbd "M-RET") 'full-mode)
