;;(require-package 'multi-term)
(require 'cl)

(setq terminal/index 0)
(setq terminal/previous-buffers ())
(setq terminal/count 4)

(defun terminal/open (index)
  (interactive)
  (add-to-list 'terminal/previous-buffers (cons index (current-buffer)))
  (eshell index))

(message terminal/previous-buffers)

(defun terminal/open-new ()
  (interactive)
  (eshell (incf terminal/index)))

(defun terminal/toggle (index)
  (if (string= (buffer-name (current-buffer)) (concat "*eshell*<" (number-to-string index) ">"))
      (switch-to-buffer (cdr (assoc index terminal/previous-buffers)))
    (terminal/open index)))

(progn
  (setq c 0)
  (while (<= (incf c) terminal/count)
      (global-set-key (kbd (concat "M-" (number-to-string c))) '(lambda ()
                                                                  (interactive)
                                                                  (terminal/toggle (symbol-value 'c))))))

(defun terminal/buffer-name-by-index (index)
  (concat "*eshell*<" (number-to-string terminal/index) ">"))

(defun terminal/run (cmd)
  (terminal/open-new)
  (with-current-buffer (terminal/buffer-name-by-index terminal/index)
    (insert cmd)
    (eshell-send-input))
  (get-buffer (terminal/buffer-name-by-index terminal/index)))

;; disable linum
(add-hook 'eshell-mode-hook (lambda () (linum-mode -1)))


;; helm completion
(add-hook 'eshell-mode-hook
          (lambda ()
            (eshell-cmpl-initialize)
            (define-key eshell-mode-map [remap eshell-pcomplete] 'helm-esh-pcomplete)
            (define-key eshell-mode-map (kbd "M-p") 'helm-eshell-history)
            (setq helm-autoresize-max-height 10)))
