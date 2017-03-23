;; konfiguracja

(setq paf/attached-files-dir "~/.paf/")
(setq paf/init-file-name ".init.el")

;; init modulu

(unless (file-exists-p paf/attached-files-dir)
  (make-directory paf/attached-files-dir))

;; procedury

(defun paf/current-project ()
  (if (boundp 'projects/current-project-directory)
      projects/current-project-directory
    nil))

(defun paf/current-project-paf-directory ()
  (concat paf/attached-files-dir
          (replace-regexp-in-string "/" "_"
                                    (substring
                                     (replace-regexp-in-string "/home/filip/Projects/" ""
                                                               (paf/current-project)) 0 -1)) "/"))

(defun paf/current-project-paf-directory-get-or-create ()
  (unless (file-exists-p (paf/current-project-paf-directory))
    (make-directory (paf/current-project-paf-directory)))
  (paf/current-project-paf-directory))

(defun paf/resolve-path (filename)
  (concat (paf/current-project-paf-directory-get-or-create) filename))

(defun paf/open-attached-file-by-name (filename)
  (interactive "sEnter file's name:")
  (let ((fullpath (paf/resolve-path filename)))
    (progn
      (if (not (file-exists-p fullpath))
          (with-temp-buffer (write-file fullpath)))
      ;;(insert fullpath)
      (switch-to-buffer (find-file-noselect fullpath)) 
      )))

;; (defun paf/get-attach-file-content (filename)
;;   (let ((fullpath (paf/resolve-path filename)))
;;     (progn
;;       (if (not (file-exists-p fullpath))
;;           (with-temp-buffer (write-file fullpath)))
;;       ;;(insert fullpath)
;;       (switch-to-buffer (find-file-noselect fullpath))
;;       (eval-buffer
;;       )))

(defun paf/resolve-path-or-create (filename)
  (let ((fullpath (paf/resolve-path filename)))
    (progn
      (if (not (file-exists-p fullpath))
          (with-temp-buffer (write-file fullpath)
                            (save-current-buffer)))
      fullpath)))

(defun paf/open-attached-file (filename)
  (interactive "sEnter a file name:")
  (paf/open-attached-file-by-name filename))

(defun paf/eval-attached-file (filename)
  (interactive "sEnter file's name:")
  (with-temp-buffer
    (insert-file-contents (paf/resolve-path-or-create filename))
    (eval-buffer)))


(defun paf/eval-init ()
  (paf/eval-attached-file paf/init-file-name)
  )

(setq paf/attached-processes-buffers '())

(defun paf/clear-attached-processes ()
  (mapcar (lambda (buffer)
            (kill-buffer buffer)
            ) paf/attached-processes-buffers))

(defun paf/run (cmd)
  (add-to-list 'paf/attached-processes-buffers (terminal/run cmd)))

(lambda ()
  ;; testing
  (paf/run "ls")
  (paf/clear-attached-processes))

(add-hook 'projectile-switch-project 'paf/clear-attached-processes)

(defun paf/register-process (index cmd)
  (interactive)
  (let ((buf (paf/run cmd)))
    (add-to-list 'paf/attached-processes-buffers '(index . buf))
    (previous-buffer)))
  
