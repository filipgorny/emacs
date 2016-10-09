;; (require-package 'sr-speedbar)
;; (require 'sr-speedbar)
;; (setq sidebar-width 40)

;; (add-hook
 ;; 'speedbar-mode-hook
  ;; '(lambda ()
       ;; (linum-mode 0)))

;; (sr-speedbar-close)

;; (setq
 ;; sr-speedbar-right-side nil
 ;; sr-speedbar-width sidebar-width
 ;; sr-speedbar-auto-refresh nil
 ;; sr-speedbar-delete-windows t)

;; (sr-speedbar-open)

;; (custom-set-variables
  ;; '(speedbar-show-unknown-files t)
;; )

;; (define-key speedbar-key-map (kbd "j") 'speedbar-next)
;; (define-key speedbar-key-map (kbd "k") 'speedbar-prev)
;; (define-key speedbar-key-map (kbd "S") 'speedbar-edit-line)

;; (defun sr-speedbar-visiting-file-hook ()
    ;; "Function that hooks `speedbar-visiting-file-hook'."
    ;; (if (boundp 'last-selected-window)
            ;; (select-window last-selected-window)))

;; (with-current-buffer sr-speedbar-buffer-name
  ;; (setq window-size-fixed 'width))

;; (define-key speedbar-key-map (kbd "<mouse-8>") 'speedbar-up-directory)

(require-package 'neotree)
(require 'neotree)
(setq neo-window-width 40)
(neotree-show)

(define-key neotree-mode-map (kbd "j") 'next-line)
(define-key neotree-mode-map (kbd "k") 'previous-line)
(define-key neotree-mode-map (kbd "SPC") (neotree-make-executor
					    :file-fn 'neo-open-file
					    :dir-fn  'neo-open-dir))

(defun f-sidebar-dir-switch (dir)
    (setq default-directory dir)
    (neotree-dir dir)
    (neotree-refresh))

(setq f-sidebar--prev-window nil)

(defun f-sidebar-toggle-focus ()
    (interactive)
    (if (eq (current-buffer) (get-buffer " *NeoTree*"))
	    (when f-sidebar--prev-window
		(select-window f-sidebar--prev-window))
	(progn
	    (setq f-sidebar--prev-window (get-buffer-window))
	    (select-window (get-buffer-window " *NeoTree*")))))

(global-set-key (kbd "M-q") 'f-sidebar-toggle-focus)
