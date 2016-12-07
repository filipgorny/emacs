;; faces ;-)
(defface font-lock-sigil-face
  '((t (:foreground "#96cf00")))
  "Face to display sigils in.")
(font-lock-add-keywords 'php-mode
  '(("\\(\\$\\)[_a-zA-Z]" 1 'font-lock-sigil-face)))

;; php mode
(require-package 'php-mode)

;; find class
(defun php/get-current-path ()
  "/home/filip/Projects/oro/monolithic/application/commerce/app/cache")

(defun php/get-project-root ()
  (replace-regexp-in-string "\~\/" "/home/filip/" (php/find-composer-dir (php/get-current-path))))

(defun php/get-source-directories ()
  '("vendor" "src"))

(defun php/get-source-paths (path)
  (mapcar (lambda (el)
	    (concat path el))
	  (php/get-source-directories)))

(defun php/find-composer-dir (path)
  (locate-dominating-file path "composer.json"))

;; testing playground:
(lambda ()
  (defun php/test ()
    (grep-find (concat "ack --follow --no-heading --no-color -r \""
		       (shell-quote-argument "class ProductRepository ") "\" " (apply 'concat (mapcar (lambda (path)
												(concat "\"" path "\" "))
											      (php/get-source-paths (php/get-project-root))
											      )
										      )
		       )
	       )
    )
)
