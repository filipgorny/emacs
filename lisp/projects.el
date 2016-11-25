(require-package 'projectile)
(require-package 'helm-projectile)

(setq projectile-completion-system 'helm)

(require-package 'perspective)
(persp-mode)
(require-package 'persp-projectile)

(projectile-mode)

(define-key projectile-mode-map (kbd "C-x p") 'projectile-persp-switch-project)
(define-key projectile-mode-map (kbd "C-x C-p") 'projectile-persp-switch-project)
