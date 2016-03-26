(require-package 'sr-speedbar)
(require 'sr-speedbar)
(setq sidebar-width 40)

(add-hook
 'speedbar-mode-hook
  '(lambda ()
       (linum-mode 0)))

(sr-speedbar-close)

(setq
 sr-speedbar-right-side nil
 sr-speedbar-width sidebar-width
 ;; sr-speedbar-width-x sidebar-width
 ;; sr-speedbar-width-console sidebar-width
 ;; sr-speedbar-max-width sidebar-width
 sr-speedbar-auto-refresh nil
 sr-speedbar-delete-windows t)

(sr-speedbar-open)

(custom-set-variables
  '(speedbar-show-unknown-files t)
)

(define-key speedbar-key-map (kbd "j") 'speedbar-next)
(define-key speedbar-key-map (kbd "k") 'speedbar-prev)
(define-key speedbar-key-map (kbd "S") 'speedbar-edit-line)

(defun sr-speedbar-visiting-file-hook ()
    "Function that hooks `speedbar-visiting-file-hook'."
    (if (boundp 'last-selected-window)
            (select-window last-selected-window)))

(with-current-buffer sr-speedbar-buffer-name
  (setq window-size-fixed 'width))

(define-key speedbar-key-map (kbd "<mouse-8>") 'speedbar-up-directory)
