;; helm
(require-package 'helm)

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x r b") 'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)

(helm-mode 1)
(defun fu/helm-find-files-navigate-forward (orig-fun &rest args)
  (if (file-directory-p (helm-get-selection))
      (apply orig-fun args)
    (helm-maybe-exit-minibuffer)))
(advice-add 'helm-execute-persistent-action :around #'fu/helm-find-files-navigate-forward)
(define-key helm-find-files-map (kbd "<return>") 'helm-execute-persistent-action)
(defun fu/helm-find-files-navigate-back (orig-fun &rest args)
  (if (= (length helm-pattern) (length (helm-find-files-initial-input)))
      (helm-find-files-up-one-level 1)
    (apply orig-fun args)))
(advice-add 'helm-ff-delete-char-backward :around #'fu/helm-find-files-navigate-back)
(defadvice helm-display-mode-line (after undisplay-header activate)
  (setq header-line-format nil))
(message "helm loaded")

;(add-to-list 'display-buffer-alist
;                    `(,(rx bos "*helm" (* not-newline) "*" eos)
;                         (display-buffer-in-side-window)
;                         (inhibit-same-window . t)
;                         (window-height . 0.4)))

(set-face-attribute 'helm-selection nil
                    :background "purple"
                    :foreground "black")

(setq helm-display-header-line nil) ;; t by default
(set-face-attribute 'helm-source-header nil :height 0.1)

;; (add-hook 'helm-after-initialize-hook (lambda ()
;;                              (progn
;;                                (linum-mode -1))))
