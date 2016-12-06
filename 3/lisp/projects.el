(require-package 'projectile)
(require-package 'helm-projectile)
(require-package 'workgroups2)
(workgroups-mode 1)
(setq wg-session-file "~/.emacs.d/.emacs_workgroups")
(setq projectile-completion-system 'helm)
(projectile-mode)

;; custom logic

(setq projects-current-directory nil)

(defun projects-get-identifier ()
  (interactive)
  (if (and (boundp 'projects-current-directory) projects-current-directory)
      (replace-regexp-in-string "\/" "__" projects-current-directory)))

(defun projects-is-project-open ()
  (not (eq (projects-get-identifier) nil)))

(defun projects-switch-project ()
  (interactive)
  (if (projects-is-project-open)
      (wg-save-session-as (projects-get-identifier)))
  (projectile-switch-project))

(define-key projectile-mode-map (kbd "C-x p") 'projects-switch-project)
(define-key projectile-mode-map (kbd "C-x C-p") 'projects-switch-project)

(setq projectile-switch-project-action '(lambda ()
					  (message (concat "Attempt to change the directory to " default-directory))
					  (setq projects-current-directory default-directory)
					  (neotree-dir default-directory)
;;					  (wg-switch-to-workgroup (default-directory))
					  ))
