(add-to-list 'load-path "~/.emacs.d/emacs-php-doc-block")
(require 'php-doc-block)

(defun fphp/php-doc-block ()
  (interactive)
  (save-excursion
    (previous-line)
    (if (string= (string-trim (get-current-line)) "*/")
        (while (not (string= "/*" (string-replace "/**" "/*" (string-trim (get-current-line)))))
          (delete-current-line)
          (previous-line)))
    (if (string= (string-trim (get-current-line)) "/**")
        (delete-current-line))
    )
  (php-doc-block)
  (next-line)
  )

(global-set-key (kbd "<C-tab>") 'fphp/php-doc-block)
