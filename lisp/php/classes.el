(defun fphp/exec-phpbrowser-with-path (cmd path arg)
  (shell-command-to-string (concat "php ~/.emacs.d/support/phpbrowser/bin/app.php " cmd " " path " " arg))
  )

(defun fphp/exec-phpbrowser-with-project-path (cmd arg)
  (fphp/exec-phpbrowser-with-path cmd projects/current-project-directory arg)
  )

(defun fphp/exec-phpbrowser-path (cmd arg)
  (fphp/exec-phpbrowser-with-project-path cmd arg)
  )

(defun fphp/find-class-full-name (class)
  (setq classes '())
  (mapcar (split-string (fphp/exec-phpbrowser-path "browser:find-class" class) "\n")
          (lambda (classentry)
            (add-to-list classes (car (split-string classentry ":")))))
  )

(defun fphp-jump-to-definition (classname)
  (setq filesfound (shell-command-to-string "php ~/.emacs.d/support/php/composer_class_finder.php"))
  )

;; testing
(lambda ()
  (fphp/find-class-full-name "Task")
  )
