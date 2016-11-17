;; faces ;-)
(defface font-lock-sigil-face
  '((t (:foreground "#96cf00")))
  "Face to display sigils in.")
(font-lock-add-keywords 'php-mode
  '(("\\(\\$\\)[_a-zA-Z]" 1 'font-lock-sigil-face)))

;; php mode
(require-package 'php-mode)

;; code parsing
(setq code-blocks ())
(setq code-parsing-current-block nil)
(setq code-parsing-state nil)

(defun code-tokenize ()
  (split-string (buffer-substring-no-properties 1 (buffer-size))))

(defun code-parse-block-open ()
  (setq code-parsing-state "block-parsing")
  )

(defun code-parse-block-close ()
  (if (eq (code-parsing-state)
  )))

(defun code-parse-class ()
  (cl-loop for token in (code-tokenize) collect
	   (if (eq (token "{"))
	       ()))
	   (message token))

;; php assist
(defun php-assist-get-current-class-name ()
  (interactive))

(defun php-assist-go-to-beginning-of-class ()
  (interactive))

(defun php-assist-insert-constructor ()
  (interactive)
  (insert "public function __construct("))
