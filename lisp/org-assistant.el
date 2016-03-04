(require 'org)

(setq todo-buffer (find-file-noselect "~/org/current.org"))
;;(with-current-buffer todo-buffer
;;    (funcall "org-mode"))))

(defun f-show-todo ()
    (interactive)
    (f-toggle-side-window todo-buffer))

(global-set-key (kbd "M-\\") 'f-show-todo)
