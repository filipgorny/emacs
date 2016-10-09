(defface font-lock-sigil-face
  '((t (:foreground "#96cf00")))
  "Face to display sigils in.")
(font-lock-add-keywords 'php-mode
  '(("\\(\\$\\)[_a-zA-Z]" 1 'font-lock-sigil-face)))

(eval-after-load "php-mode" '(lambda ()
                                 (global-set-key (kbd "M-q") 'f-neotree-toggle)))

(require-package 'php-mode)
(require 'php-mode)
