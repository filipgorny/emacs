(require-package 'neotree)
(setq neo-window-width 30)
(setq neo-smart-open t)
(setq projectile-switch-project-action 'neotree-projectile-action)

;; keybindings
(define-key neotree-mode-map (kbd "j") 'next-line)
(define-key neotree-mode-map (kbd "k") 'previous-line)
(define-key neotree-mode-map (kbd "SPC") (neotree-make-executor
					    :file-fn 'neo-open-file
					    :dir-fn  'neo-open-dir))

;; toggling focus
(defun f-sidebar-dir-switch (dir)
    (setq default-directory dir)
    (neotree-dir dir)
    (neotree-refresh))

(setq f-sidebar--prev-window nil)

(defun f-sidebar-toggle-focus ()
    (interactive)
    (if (eq (current-buffer) (get-buffer " *NeoTree*"))
	    (when f-sidebar--prev-window
		(select-window f-sidebar--prev-window))
	(progn
	    (setq f-sidebar--prev-window (get-buffer-window))
	    (select-window (get-buffer-window " *NeoTree*")))))

(global-set-key (kbd "M-q") 'f-sidebar-toggle-focus)
