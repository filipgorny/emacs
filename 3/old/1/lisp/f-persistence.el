(setq vardir "~/.emacs.d/var/")

(defun f-generate-key (name)
    (replace-regexp-in-string "[^[:alpha:][:digit:]_-]" "" name))

(defun f-persist-put (name value)
    (with-current-buffer (find-file-noselect (concat vardir (f-generate-key name)))
        (erase-buffer)
        (prin1 value)
        (insert (prin1-to-string value))
	(save-buffer)
	(kill-buffer)))

(defun f-persist-get (name)
    (with-current-buffer (find-file-noselect (concat vardir (f-generate-key name)))
        (let ((value (read (buffer-string))))
	    (kill-buffer)
	    value)))

(lambda ()
    (f-persist-put "foo" "bar")
    (princ (f-persist-get "foo")))

(provide 'f-persistence)
;;; f-persistence.el ends here
