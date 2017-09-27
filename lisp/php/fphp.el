;; (progn
;;   (defvar fphp-mode-hook nil)

;;   (defvar fphp-mode-map
;;     (let ((map (make-keymap)))
;;       (define-key map "RET" '(lambda ()
;;                                (message "ret")))
;;       map)
;;     "Keymap for Filip's php library")

;;   (define-derived-mode fphp-mode text-mode "Filip's PHP mode")
;; )

(setq fphp-states-current '())

(setq fphp-states-match '(
                            ("docblock" . ("/**" "*/"))
                            ))

(defun fphp-newline ()
  (interactive)
  (setq line (string-trim (thing-at-point 'line)))
  (mapcar '(lambda (el)
             (if (string-equal line (nth 1 el))
                 (push (first el) fphp-states-current)
               )
             )
          fphp-states-match)
  (flisp-foreach fphp-states (lambda (e) (insert e)))
  (newline-and-indent)
  )

(define-key fphp-mode-map (kbd "<RET>") #'fphp-newline)




(define-minor-mode fphp-mode
  "Toggle Filip's PHP mode."
  ;; The initial value.
  :init-value nil
  ;; The indicator for the mode line.
  :lighter " FPHP"
  ;; The minor mode bindings.
  :keymap
  '()
  :group '())


