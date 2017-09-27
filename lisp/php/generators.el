(defun fphp-genereate-class-body (fileName)
  (shell-command-to-string (concat "php ~/.emacs.d/support/php/generators/class.php " fileName))
  )

(defun fphp-generate-current-file-class-body ()
  (interactive)
  (insert (fphp-genereate-class-body (buffer-file-name)))
  (previous-line)
  (previous-line)
  (previous-line)
  (end-of-line)
  )

;; testing
(lambda ()
  (fphp-genereate-class-body "~/Projects/devell/center/services/draft/cms/src/Devell/Cms/Cms.php")
  )
