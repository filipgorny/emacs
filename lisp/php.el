(require-package 'php-mode)
(require 'php-mode)

(defface font-lock-sigil-face
  '((t (:foreground "#96cf00")))
  "Face to display sigils in.")
(font-lock-add-keywords 'php-mode
			'(("\\(\\$\\)[_a-zA-Z]" 1 'font-lock-sigil-face)))

(require-package 'yasnippet)

(add-hook 'php-mode-hook
	  '(lambda ()
	     (auto-complete-mode t)
	     (require-package 'ac-php)
	     (yas-global-mode 1)
	     (setq ac-sources  '(ac-source-php ) )
	     (define-key php-mode-map  (kbd "C-]") 'ac-php-find-symbol-at-point)   ;goto define
	     (define-key php-mode-map  (kbd "C-t") 'ac-php-location-stack-back) ;go back
	     (require-package 'php-auto-yasnippets)
	     (require-package 'php-extras)
	     ))


