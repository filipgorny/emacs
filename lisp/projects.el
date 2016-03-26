(setq f-workspace-current nil)
(setq f-workspace-current-buffers '())

(defstruct f-project name opened-files)

(defun f-workspace-buffer-remember-opened (x)
    (if (not (memq x f-workspace-current-buffers))
            (add-to-list 'f-workspace-current-buffers x)))

(defun f-workspace-buffer-opened ()
    (f-workspace-buffer-remember-opened (buffer-name)))

(defun f-workspace-buffer-closed ()
    (let (buffer (get-buffer))
        (setq f-workspace-current-buffers (remove buffer f-workspace-current-buffers))))

(add-hook 'find-file-hook 'f-workspace-buffer-opened)
(add-hook 'kill-buffer-hook 'f-workspace-buffer-closed)

(defun f-workspace-current-filenames ()
    (mapcar (lambda (x) (buffer-file-name (get-buffer x))) f-workspace-current-buffers))

(defun f-workspace-key (name)
    (catch 'err
        (if (not f-workspace-current)
                (throw 'err "Not in a project."))
        (concat "project " name)))

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
    (message (concat "Loading " (f-workspace-key name))))

(defun f-workspace-clear ()
      (mapc '(lambda (x)
                 (if (get-buffer x)
                         (progn
                             (kill-buffer (get-buffer x))))) f-workspace-current-buffers))

(defun f-workspace-open (project-dir)
        (if (not (file-exists-p project-dir))
            (progn
                (message "Directory doesn't exist"))
        (progn
            (f-workspace-load project-dir)
            (f-sidebar-dir-switch project-dir)
            (setq f-workspace-current project-dir)
            (ggtags-mode 1)
            (ggtags-update-tags))))

(defun f-workspace-switch (project-dir)
    (interactive "sEnter project name: ")
    (f-workspace-save)
    (f-workspace-clear)
    (f-workspace-open project-dir))


(global-set-key (kbd "C-x p") 'f-workspace-switch)
(global-set-key (kbd "C-x C-p") 'f-workspace-switch)

(defun f-sidebar-dir-switch (dir)
    (setq default-directory dir)
    (message (concat "Changing sidebar directory" dir))
    (sr-speedbar-refresh))

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
