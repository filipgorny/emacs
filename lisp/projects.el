;; projectile
(require-package 'projectile)
(require-package 'helm-projectile)
(projectile-global-mode)

(global-set-key (kbd "C-x p") 'helm-projectile-switch-project)
(global-set-key (kbd "C-x C-p") 'helm-projectile-switch-project)
