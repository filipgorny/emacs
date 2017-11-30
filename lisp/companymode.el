(require-package 'company)
(load "helm-company")
(eval-after-load 'company
  '(progn
     (define-key company-mode-map (kbd "C-:") 'helm-company)
     (define-key company-active-map (kbd "C-:") 'helm-company)))
(company-mode 1)

(defun company-my-backend (command &optional arg &rest ignored)
    (interactive (list 'interactive))
    (case command
      (interactive (company-begin-backend 'company-my-backend))
      (prefix (when (looking-back "foo\\>")
                (match-string 0)))
      (candidates (when (equal arg "foo")
                    (list "foobar" "foobaz" "foobarbaz")))
      (meta (format "This value is named %s" arg))))

foo\>
