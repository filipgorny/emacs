(defun my-php-mode-hook ()
  "My PHP-mode hook."
  (require 'flycheck-phpstan)
  (flycheck-mode t)
  (flycheck-select-checker 'phpstan))

(add-hook 'php-mode-hook 'my-php-mode-hook)

(setq-default phpstan-working-dir "~/.emacs.d/phpstan")
