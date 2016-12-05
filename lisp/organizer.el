(setq organizer-dir-name "~/Documents/org/")

;; (defun organizer-open ()
;;   (if (not (file-exists-p organizer-dir-name))
;;       (mkdir organizer-dir-name))
;;   (let ((organizer-buffer "organizer"))
;;     (switch-to-buffer organizer-buffer)
;;     (org-mode)) )

(defun organizer-open-emacs-todo ()
  (find-file (concat organizer-dir-name "emacs.org")))
