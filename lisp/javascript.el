(require-package 'js2-mode)

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(custom-set-variables
 '(js2-basic-offset 4)
 '(js2-bounce-indent-p t)
)

(defface font-lock-sigil-face
  '((t (:foreground "#96cf00")))
  "Face to display sigils in.")

(add-hook 'js2-mode-hook (lambda()
                           (message "js mode")
                           (font-lock-add-keywords 'js2-mode '(("\\<self\\>" . 'font-lock-sigil-face)))))
