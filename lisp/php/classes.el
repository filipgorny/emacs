(cl-defstruct phpclass name filepath)

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
  (mapcar 
          (lambda (classentry)
            (setq classentry-split (split-string classentry ":"))
            (make-phpclass :name (car classentry-split) :filepath (nth 1 classentry-split)))
          (-filter
           (lambda (n) (not (string= "" n)))
                   (split-string (fphp/exec-phpbrowser-path "browser:find-class" class) "\n")))
  )

(defun fphp-jump-to-definition (classname)
  (setq filesfound (shell-command-to-string "php ~/.emacs.d/support/php/composer_class_finder.php"))
  )

(defun fphp/import-class (classname)
  (fphp/insert-use-statement (helm :sources (helm-build-sync-source "Import class"
                   :candidates (mapcar (lambda (class) (phpclass-name class)) (fphp/find-class-full-name classname)))))
  )

(defun fphp/import-class-at-point ()
  (interactive)
  (fphp/import-class (get-current-word)))

(eval-after-load "php-mode"
  '(progn
     (define-key php-mode-map  (kbd "C-c i") 'fphp/import-class-at-point)))

;; testing
(lambda ()
  (setq classname "Task")
  (fphp/find-class-full-name "Task")
  )
