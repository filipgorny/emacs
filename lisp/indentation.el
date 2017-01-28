(load "highlight-indentantion")

(defun indentation-highlight ()
  (interactive)
  (highlight-indentation-mode 1)
  (set-face-background 'highlight-indentation-face "#0a0a0a")
  (set-face-background 'highlight-indentation-current-column-face "#2c2c2c")
  )

(add-hook 'php-mode 'indentation-highlight)
(add-hook 'js-mode 'indentation-highlight)
(indentation-highlight)
