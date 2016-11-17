;; faces ;-)
(defface font-lock-sigil-face
  '((t (:foreground "#96cf00")))
  "Face to display sigils in.")
(font-lock-add-keywords 'php-mode
  '(("\\(\\$\\)[_a-zA-Z]" 1 'font-lock-sigil-face)))

;; php mode
(require-package 'php-mode)

;; generators
(defun code-tokenize ()
  (split-string (buffer-string)))

(defun php-assist-get-current-class-name ()
  (interactive))
()
(defun php-assist-go-to-beginning-of-class ()
  (interactive))

(defun php-assist-insert-constructor ()
  (interactive)
  (insert "public function __construct("))
