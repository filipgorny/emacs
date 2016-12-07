(require-package 'projectile)
(require-package 'helm-projectile)
(require-package 'workgroups2)
(workgroups-mode 1)
(setq wg-session-file "~/.emacs.d/.emacs_workgroups")
(setq projectile-completion-system 'helm)
(projectile-mode)

(setq projects/sessions-dir "/home/filip/.emacs.d/projects-data/")
(setq projects/current-directory nil)

(setq projectile-switch-project-action '(lambda ()
					  (setq projects/current-directory default-directory)
					  (neotree-dir default-directory)
					  (other-window 1)
					  (wg-switch-to-workgroup projects/current-directory)
					  ))

(defun projects/switch ()
  (interactive)
  (if projects/current-directory
      (progn
  	(neotree-hide)
  	(wg-save-session)
  	(neotree-show)
	(message "Session saved")))
  (projectile-switch-project))

;; keys binding

(define-key projectile-mode-map (kbd "C-x p") 'projects/switch)
(define-key projectile-mode-map (kbd "C-x C-p") 'projects/switch)
