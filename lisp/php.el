(require-package 'php-mode)

(defface font-lock-sigil-face
  '((t (:foreground "#8888ff")))
  "Face to display sigils in.")
(font-lock-add-keywords 'php-mode
			'("\\(\\$\\)[_a-zA-Z]" 1 'font-lock-sigil-face))
(font-lock-add-keywords 'php-mode
			'("$this" 1 'font-lock-variable-name-face))

(make-face 'php-comment-face)
(set-face-foreground 'php-comment-face "LightGrey")
(make-face 'php-variable-face)
(set-face-foreground 'php-variable-face "#8888ff")
(add-hook 'php-mode-hook 
	  (lambda ()
	    (set (make-local-variable 'font-lock-comment-face) 'php-comment-face)
	    (set (make-local-variable 'font-lock-variable-name-face) 'php-variable-face)))

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


