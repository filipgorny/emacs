(setq tramp-default-method "ssh")

(setq machines/index 0)

(defun machines/enter (name user)
  (let ((index (- 999 (incf machines/index))))
    (eshell index)
    (with-current-buffer (concat "*eshell*<" (number-to-string index) ">"))
      (eshell-return-to-prompt)
      (insert "cd /ssh:filip@devell.co:~")
      (eshell-send-input)
      (insert "clear")
      (eshell-send-input)))

(setq tramp-verbose 10)

(global-set-key (kbd "<M-f12>") (lambda ()
                                  (interactive)
                                  (machines/enter "devell.co" "filip")))
