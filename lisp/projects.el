;; projectile
(require-package 'projectile)
(require-package 'helm-projectile)
(projectile-global-mode)

;;(require-package 'workgroups2)
;;(workgroups-mode 1)

(defvar project-switch-hook nil
  "Hook called after the project is switched")

;;(add-hook 'project-switch-hook (lambda ()
				   ;;(wg-switch-to-workgroup (projectile-project-root))))

(defun projects/reload ()
  (interactive)
  (run-hooks 'project-switch-hook))

(defun projects/switch ()
  (interactive)
  (helm-projectile-switch-project))

(setq projectile-switch-project-action 'projects/reload)

(global-set-key (kbd "C-x p") 'projects/switch)
(global-set-key (kbd "C-x C-p") 'projects/switch)
