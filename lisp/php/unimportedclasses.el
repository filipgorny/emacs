(add-to-list 'load-path "~/.emacs.d/ov.el")
(load "ov.el")

(defface class-undefined-face
  '((t :foreground "#FF88FF" :weight bold))
  "Face for printr function")

(defface class-defined-face
  '((t :foreground "#FFFF00" :weight bold))
  "Face for printr function")

(cl-defstruct classentry word overlay begin end)

Login $login;

(setq classentries '())

(defun fphp/find-unimported-classes ()
  (interactive)
  (mapcar (lambda (classentry)
            (ov-clear (classentry-overlay classentry))
            )
          classentries)
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
          (add-to-list 'classentries (make-classentry :word word :begin wordpoint :end endwordpoint))))
    (mapcar (lambda (classentry)
              (message (classeentry-begin classentry))
              (ov (classentry-begin classentry) (clasentry-end classentry) 'face 'class-defined-face)
;;              (if (buffer-contains-string (concat "use [A-Z+\\]+" word ";"))
  ;;                (let ((case-fold-search nil))
    ;;                (goto-point (point-min))
      ;;                )
        ;;            )
                  ;;(ov-set classregexp 'face 'class-defined-face '(classentry-overlay classentry) t)
                ;;(ov-set classregexp 'face 'class-undefined-face '(classentry-overlay classentry) t)
                ;; )
              )
            classentries)
    )

(add-hook 'php-mode-hook '(lambda ()
                            (add-hook 'after-change-functions '(lambda (&rest _) (let ((inhibit-modification-hooks nil))
                                                                                   (fphp/test-after-change-classes))) nil t)))





















