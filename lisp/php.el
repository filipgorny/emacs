;; faces ;-)
(defface font-lock-sigil-face
  '((t (:foreground "#96cf00")))
  "Face to display sigils in.")
(font-lock-add-keywords 'php-mode
  '(("\\(\\$\\)[_a-zA-Z]" 1 'font-lock-sigil-face)))

;; php mode
(require-package 'php-mode)

;; find class
(defun php/get-current-file-path ()
  "/home/filip/Projects/devell/center/symfony-app/src/AppBundle/AppBundle.php")

(defun php/get-project-root ()
  (php/find-composer-dir))

(defun php/get-source-directories ()
  '("vendor" "src"))

(defun php/get-source-paths (path)
  (mapcar (lambda (el)
	    (concat path el))
	  (php/get-source-directories)))

(defun php/find-composer-dir (path)
  (concat (locate-dominating-file path "src") "vendor/autoload.php"))

(add-hook 'php-mode-hook (lambda ()
                           (electric-pair-mode 1)
                           ))

(lambda () 
  (let ((autoload-dir (php/find-composer-dir (php/get-current-file-path)))
       (classnames (if autoload-dir
           (progn
             ))))
    ()))

(load-file "~/.emacs.d/lisp/php/generators.el")
;(load-file "./php/findclass.el")
;(load-file "./php/classbody.el")
(load-file "~/.emacs.d/lisp/php/phpunit.el")
(load-file "~/.emacs.d/lisp/php/common.el")
(load-file "~/.emacs.d/lisp/php/docblock.el")
(load-file "~/.emacs.d/lisp/php/getterssetters.el")
(load-file "~/.emacs.d/lisp/php/namespace.el")
(load-file "~/.emacs.d/lisp/php/classes.el")
;; lsp
(setq lsp-php-server-install-dir "~/.emacs.d/php-language-server") 

(add-to-list 'load-path "~/.emacs.d/lsp/lspphp")
(add-to-list 'load-path "~/.emacs.d/lsp/lspmode")
(add-to-list 'load-path "~/.emacs.d/lsp/ui")

;(require 'lsp-mode)                     ;

;(require-package 'flycheck)
;(require-package 'markdown-mode)
;(require 'lsp-ui)
;(add-hook 'lsp-mode-hook 'lsp-ui-mode)

;(require 'lsp-php)
;(add-hook 'php-mode-hook #'lsp-mode)

;(require-package 'company-lsp)

;;; other config
;; For php-language-server
;(require 'flycheck)

;(require 'lsp-php) ;if you want to enable php-language-server

;(require 'php-mode)
;(require 'lsp-mode)

;; for flycheck integration, which lets you see errors in your editor
;(require 'lsp-ui)                       ;
;(add-hook 'lsp-mode-hook 'lsp-ui-mode)
;(add-hook 'php-mode-hook 'flycheck-mode)
;; Not sure if lsp-mode is necessary if lsp-ui-mode
;(add-hook 'php-mode-hook 'lsp-mode)

;(add-hook 'php-mode-hook #'lsp-php-enable)

