(require 'subr-x)

(defun fphp-genereate-class-body (fileName)
  (shell-command-to-string (concat "php ~/.emacs.d/support/php/generators/class.php " fileName))
  )

(defun fphp-generate-current-file-class-body ()
  (interactive)
  (insert (fphp-genereate-class-body (buffer-file-name)))
  (previous-line)
  (previous-line)
  (previous-line)
  (end-of-line)
  )

;; testing
(lambda ()
  (fphp-genereate-class-body "~/Projects/devell/center/services/draft/cms/src/Devell/Cms/Cms.php")
  )

(defun fphp-generate-property-from-current-line ()
  (interactive)
  (setq name (string-trim (replace-regexp-in-string "\n" "" (thing-at-point 'line t))))
  (kill-whole-line)
  (insert (concat "    private $" name ";\n\n\n"))
  (previous-line)
  (insert "    ")
  )

;; auto insert new class body
(auto-insert-mode t)

;; (eval-after-load 'autoinsert
;;   '(define-auto-insert '("\\.php\\'" . "PHP class skeleton")
;;      '("test")))
;;        ;;(fphp-generate-current-file-class-body))))

(define-auto-insert "\.php" "my-php-template.php")

(lambda ()
  (find-file "/home/filip/.emacs.d/support/php/generators/class.php")
  )
