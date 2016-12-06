(setq f-workspace-current nil)

(defstruct f-project name opened-files)

(defun f-workspace-current-filenames ()
    (setq buffers '())
    (mapcar (lambda (x)
	      (setq b (buffer-file-name x))
	      (when b
		      (add-to-list 'buffers b)))
	      (buffer-list))
    buffers)

(defun f-workspace-key (name)
    (concat "project " name))

(defun f-workspace-current-key ()
    (f-workspace-key f-workspace-current))

(defun f-workspace-save ()
    (if (not f-workspace-current)
            (progn
                (message "Not in a project."))
        (progn
            (setq project-config '())
            (setq project (make-f-project :name (f-workspace-current-key) :opened-files (f-workspace-current-filenames)))
            (f-persist-put (f-workspace-current-key) project))))

(defun f-workspace-load (name)
    (let ((newkey (f-workspace-key name)))
	(message newkey)
	(let ((openedproject (f-persist-get newkey)))
	    (mapc (lambda (file)
		      (message (concat "Reopening file " file))
		      (find-file-noselect file))
		  (f-project-opened-files openedproject)))))

(defun f-workspace--is-special-buffer (buf-name)
    (or (string-equal "*" (substring buf-name 0 1)) (string-equal "*" (substring buf-name 1 2)) (string-equal buf-name "shell")))

(defun f-workspace-clear ()
    (mapc (lambda (buf)
	      (if (not (f-workspace--is-special-buffer (buffer-name buf)))
		      (kill-buffer buf)))
	  (buffer-list)))

;; todo - select the tab that was visible before
(defun f-workspace-open (project-dir)
        (if (not (file-exists-p project-dir))
            (progn
                (message "Directory doesn't exist"))
        (progn
            (f-workspace-load project-dir)
            (f-sidebar-dir-switch project-dir)
            (setq f-workspace-current project-dir))))
            ;; (ggtags-mode 1)
            ;; (ggtags-update-tags))))

(defun f-workspace-switch (project-dir)
    (interactive "sEnter project name: ")
    (f-workspace-save)
    (f-workspace-clear)
    (f-workspace-open project-dir))

(global-set-key (kbd "C-x p") 'f-workspace-switch)
(global-set-key (kbd "C-x C-p") 'f-workspace-switch)



(add-hook 'kill-emacs-hook (lambda ()
                               (f-workspace-save)))

;; testing (TODO remove it)
(lambda ()
    (setq f-workspace-current-buffers nil)
    (f-workspace-switch "~/Projects/target/wolnemaszyny/")
    (f-workspace-switch "~/.emacs.d/")
    (f-persist-put f-workspace-current-key "test")
    (f-persist-get f-workspace-current-key)
    (f-workspace-save)
    (f-workspace-clear)
    (f-workspace-load "~/.emacs.d/")
    (f-workspace-load "~/Projects/target/wolnemaszyny/")
    (f-workspace-buffer-opened)
    (f-workspace-save)
    (f-persist-get 'last-project)
    (f-workspace-clear))
