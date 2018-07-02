(add-to-list 'load-path "~/.emacs.d/lsp/lspphp")

(defface class-undefined-face
  '((t :foreground "#FF88FF" :weight bold))
  "Face for printr function")

(defface class-defined-face
  '((t :foreground "#FFFF00" :weight bold))
  "Face for printr function")

(cl-defstruct classentry word start end)

(defun fphp/find-unimported-classes ()
  (interactive)
  (setq classentries '())
  (save-excursion
  (goto-char (point-min))
  (while (re-search-forward "$[A-Z]+" nil t)
    (backward-word)
    (backward-word)
    (setq word (current-word))
    (setq wordpoint (point))
    (forward-word)
    (setq endwordpoint (point))
    (forward-word)
    (if (string= (capitalize word) word)
        (add-to-list 'classentries (make-classentry :word word :start wordpoint :end endwordpoint))))
  (mapcar (lambda (classentry)
            (goto-char (point-max))
            (setq word (classentry-word classentry))
            ;;(remove-text-properties wordpoint endwordpoint '(face nil))
            (if (buffer-contains-string (concat "use [A-Z+\\]+" word))
                (progn
                  (let ((inhibit-modification-hooks t))
                  (put-text-property (classentry-start classentry) (classentry-end classentry) 'face 'class-defined-face)))
              (progn
                (let ((inhibit-modification-hooks t))
                  (put-text-property (classentry-start classentry) (classentry-end classentry) 'face 'class-undefined-face))
                )
              )
          ) classentries)
  ))



(defun test-text-property ()
  (interactive)
  (setq wordpoint (point))
  (forward-word)
(setq endwordpoint (point))
(let ((inhibit-modification-hooks t))
  (make-face 'temp-face)
  (set-face-background 'temp-face "cyan")
  (put-text-property wordpoint endwordpoint 'face 'temp-face)
  ))

(lambda ()
  (setq word "Login")
  (fphp/find-unimported-classes)

                    (let ((inhibit-modification-hooks t))
                    (put-text-property wordpoint endwordpoint 'face 'class-defined-face))
              (let ((inhibit-modification-hooks t))
                (put-text-property wordpoint endwordpoint 'face 'class-undefined-face))

              (font-lock-add-keywords 'emacs-lisp-mode
  '(("foo" . font-lock-keyword-face)))
              )



(add-hook 'after-change-hook (let ((inhibit-modification-hooks nil))
                               (fphp/find-unimported-classes)) nil t)

(defun fphp/test-after-change-classes (&rest _)
  (fphp/find-unimported-classes))

(add-hook 'php-mode-hook '(lambda ()
                            (add-hook 'after-change-functions '(lambda (&rest _) (let ((inhibit-modification-hooks nil))
                                                                                   (fphp/test-after-change-classes))) nil t)))





















