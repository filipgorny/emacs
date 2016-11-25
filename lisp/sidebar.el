(require-package 'neotree)

(neotree-toggle)

(defun neotree-disable-mode-line ()
  (other-window 1)
  (setq mode-line-format nil)
  (other-window 1))

(defun neotree-disable-linum ()
  (other-window 1)
  (linum-mode -1)
  (other-window 1))

(neotree-disable-mode-line)
(neotree-disable-linum)

(defadvice projectile-persp-switch-project (after projectile-persp-switch-project activate)
  (neotree-dir default-directory))
