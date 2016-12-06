;; faces ;-)
(defface font-lock-sigil-face
  '((t (:foreground "#96cf00")))
  "Face to display sigils in.")
(font-lock-add-keywords 'php-mode
  '(("\\(\\$\\)[_a-zA-Z]" 1 'font-lock-sigil-face)))

;; php mode
(require-package 'php-mode)

;; code parsing
(setq code/blocks ())
(setq code/parsing-state nil)

(defun code/set-parsing-state (name)
  (setq code/parsing-state name))

(defun code/tokenize ()
  (split-string (buffer-substring-no-properties 1 (buffer-size))))
;; use isearch to find first {
;; save the position, add it to list of block openings positions
;; repeat process to find block close } positions
;; iterate over list of { and if there is } at the same position in } array, add a block info to block list
;; block info structure should have: position start, position ends, parent block index in block list

(defun code/parsing-in-state (name)
  (eq (code/parsing-state name)))

(defun code/parse-block-open ()
  )

(defun code/parse-block-close ()
      )

(defun code/parse-characters ()
  (cl-loop for i from 0 to (- (buffer-size) 1) do
	   (if (char-after i)
	       (message (string (char-after i))))))

;; php assist
(defun php-assist-get-current-class-name ()
  (interactive))

(defun php-assist-go-to-beginning-of-class ()
  (interactive))

(defun php-assist-insert-constructor ()
  (interactive)
  (insert "public function __construct("))
