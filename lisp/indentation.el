(load "highlight-indentantion")

(defun indentation-highlight ()
  (interactive)
  (highlight-indentation-mode 1)
  (set-face-background 'highlight-indentation-face "#111112")
  (set-face-background 'highlight-indentation-current-column-face "#191919")
  )

(add-hook 'php-mode 'indentation-highlight)
(add-hook 'js-mode 'indentation-highlight)
(indentation-highlight)
