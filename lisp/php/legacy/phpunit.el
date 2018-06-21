;; /usr/bin/php /home/filip/Projects/eatpoint/backend/vendor/phpunit/phpunit/phpunit --no-configuration --filter "/::testRegistration( .*)?$/" Tests\Functional\Registration\CustomerRegistrationTest /home/filip/Projects/eatpoint/backend/tmp/functional/Registraion/CustomerRegistrationTest.php --teamcity

(setq fphp-phpunit-setup '(
                           ("options" "--bootstrap ./vendor/autoload.php")
                           ("cmd" "/usr/bin/php /home/filip/Projects/eatpoint/backend/vendor/phpunit/phpunit/phpunit")
                       ))

(defun fphp-phpunit-setup-get (key)
 (first (cdr (assoc key fphp-phpunit-setup)))
  )

(defun fphp-phpunit-run (file)
  (interactive)
  (let* (
        (command (concat (fphp-phpunit-setup-get "cmd") " " (fphp-phpunit-setup-get "options") " " file))
        (default-directory (fphp-phpunit-root-directory))
        (outputbuffer (generate-new-buffer "phpunit"))
        (commandoutput (shell-command-to-string command))
        )
    (progn
     (split-window-vertically)
     (other-window 1)
     (switch-to-buffer outputbuffer)
     (ftests-mode)
     (insert commandoutput)
     (scroll-down)
    )
    )
  )

(defun fphp-phpunit-run-current-buffer ()
  (interactive)
  (fphp-phpunit-run (buffer-file-name)))

(defun fphp-phpunit-root-directory ()
  (message projects/current-project-directory))

(lambda ()
  "tests"
  (fphp-phpunit-run "d"))

(progn
  (defvar ftests-mode-hook nil)

  (defvar ftests-mode-map
    (let ((map (make-keymap)))
      (define-key map "q" '(lambda ()
                             (kill-buffer)
                             (delete-window)))
      map)
    "Keymap for Tests running major mode")

  (define-derived-mode ftests-mode text-mode "Testing mode")
)

(define-key ftests-mode-map (kbd "<f9>") '(lambda ()
                                            (interactive)
                                            (kill-buffer)
                                            (delete-window)))

(global-set-key (kbd "<f9>") 'fphp-phpunit-run-current-buffer)
