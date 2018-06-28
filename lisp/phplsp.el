(custom-set-variables
  ;; Run php-language server with a different php interpreter and from a different location.
  '(lsp-php-language-server-command (quote ("/usr/bin/php" "/home/filip/.emacs.d/php-language-server/vendor/bin/php-language-server.php")))
  ;; Composer.json detection after Projectile.
  '(lsp-php-workspace-root-detectors (quote (lsp-php-root-projectile lsp-php-root-composer-json "index.php" "robots.txt")))
  )

; The melpa version is out of date, install from a local checkout
(add-to-list 'load-path "~/.emacs.d/lsp/lspphp")

; For php-language-server
(require 'flycheck)

(require 'lsp-php) ;if you want to enable php-language-server

(require 'php-mode)
(require 'lsp-mode)

; for flycheck integration, which lets you see errors in your editor
(require 'lsp-ui)
;(add-hook 'lsp-mode-hook 'lsp-ui-mode)
(add-hook 'php-mode-hook 'flycheck-mode)
; Not sure if lsp-mode is necessary if lsp-ui-mode
(add-hook 'php-mode-hook 'lsp-mode)

(add-hook 'php-mode-hook #'lsp-php-enable)

(require-package 'company-lsp)

(push 'company-lsp company-backends)
