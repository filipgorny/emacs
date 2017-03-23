(require-package 'helm-gtags)

(defun tags/update ()
  (interactive)
  (if (boundp 'projects/current-project-directory)
      (helm-gtags-create-tags projects/current-project-directory)))

(lambda ()
  (message projects/current-project-directory)
  (tags/update))

(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
              (helm-gtags-mode 1))))

(add-hook 'php-mode-hook
          (lambda ()
            (helm-gtags-mode 1)))
