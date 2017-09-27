(defun ps/find-src-path (fileName)
  ;;(pop (split-string (expand-file-name fileName) "src"))
  (let ((pathl (last (split-string (expand-file-name fileName) "src"))))
    (pop pathl)
    ))

(defun ps/create-namespace-from-path (fileName)
  (substring (replace-regexp-in-string "\/" "\\\\" (ps/find-src-path fileName)) 1))


(lambda ()
    (setq testpath "~/Projects/devell/center/panel/symfony-app/src/Devell/Elements/Bundle/AccountsBundle/ApiKeyAuth/ApiKeyAuthenticator")

  ;;(ps/find-src-path "~/Projects/devell/center/panel/symfony-app/src/Devell/Elements/Bundle/AccountsBundle/ApiKeyAuth/ApiKeyAuthenticator")
  (ps/create-namespace-from-path testpath)
  (message projects/current-project-directory)
  )


;;---

(defun php-oo/class-name-from-file (fileName)
  (setq fileNameBase (file-name-base fileName))
  (concat (upcase (substring fileNameBase 0 1)) (substring fileNameBase 1)))


(defun php-oo/create-new-class-body (fileName)
  (setq body (concat
              "<?php\n\nnamespace " (ps/create-namespace-from-path fileName) ";\n\n"
              "class " (php-oo/class-name-from-file fileName) "\n{\n\t\n}"
                     )))

;; public

;; -- class

(defun php-oo/insert-class-header ()
  (interactive)
  (insert (php-oo/create-new-class-body (buffer-file-name))))

;; -- tests

(defun ps-php-test()
  (interactive)
  (eval-buffer)
  (setq testpath "~/Projects/devell/center/panel/symfony-app/src/Devell/Elements/Bundle/AccountsBundle/ApiKeyAuth/ApiKeyAuthenticator")

  (message (php-oo/create-new-class-body testpath)))

(global-set-key (kbd "M-n") 'ps-php-test)

