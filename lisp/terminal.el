(load "multiterm")

;; source: https://github.com/daimrod/Emacs-config/blob/master/config/config-multi-term.el

(setq multi-term-program "/bin/zsh"
      term-unbind-key-list '("C-x"
                             "C-h"
                             "M-x"
                             "C-z"
			     "M-w"
			     ))
      ;; required to configure properly the environment
      ;; with AnSiT? variables in .bashrc
      ;; TERM is restored to xterm-256-color after that.
;;      term-term-name "xterm-256color")	

;; end of copied code

(add-hook 'term-mode-hook (lambda()
                (yas-minor-mode -1)))
(add-hook 'term-mode-hook (lambda()
			    (setq yas-dont-activate t)))

(defadvice save-buffers-kill-emacs (around no-query-kill-emacs activate)
  "Prevent annoying \"Active processes exist\" query when you quit Emacs."
  (flet ((process-list ())) ad-do-it))

;;

(set-face-attribute 'term nil :background "#181818")

;;

(defun terminal/toggle ()
  (interactive)
  (if (multi-term-dedicated-exist-p)
      (progn
	(multi-term-dedicated-close))
    (progn
      (multi-term-dedicated-open)
      (multi-term-dedicated-select)
      (linum-mode -1))))

(global-set-key (kbd "M-w") 'terminal/toggle)
