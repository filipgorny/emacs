;;(require-package 'bookmark+)
;;(require 'bookmark+)

(defun f-switch-project (directory)
    (interactive)
    (if (not (file-exists-p directory))
            (progn
                (message "Project directory doesn't exists")
                (return-value)))
    (setq project-tab (elscreen-create))
    (elscreen-goto project-tab)
    (neotree-dir directory))

(f-switch-project "~/.emacs.d/init.el")
