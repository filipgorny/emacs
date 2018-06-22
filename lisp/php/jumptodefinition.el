(defun fphp/exec-phpbrowser-with-path (cmd path arg)
  (shell-command-to-string (concat "php ~/.emacs.d/support/phpbrowser/bin/app.php " cmd path arg))
  )

(defun fphp/exec-phpbrowser-with-project-path (cmd arg)
  (fphp/exec-phpbrowser-with-path (cmd projects/current-project-directory arg))
  )

(defun fphp/find-class-full-name )

(defun fphp-jump-to-definition (classname)
  (setq filesfound (shell-command-to-string "php ~/.emacs.d/support/php/composer_class_finder.php"))
  )
