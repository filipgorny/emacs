(defun planning/file-path (Y m d name)
  (progn
    (if (not (file-exists-p "~/org/planning/"))
        (make-directory "~/org/planning/"))
    (let* ((year-dir (concat "~/org/planning/" Y "/"))
          (month-dir (concat year-dir m "/"))
          (day-dir (concat month-dir d "/"))
          (full-path (concat day-dir name ".org"))
          (create-dir-if-not-exists (lambda (file)
                                      (if (not (file-exists-p (symbol-value file)))
                                        (make-directory (symbol-value file)))
                                      )))
      (progn
        (mapcar create-dir-if-not-exists '(year-dir month-dir day-dir))
        full-path))))


(defun planning/open-today ()
  (interactive)
  (find-file (planning/file-path (format-time-string "%Y") (format-time-string "%m") (format-time-string "%d") "plan")))

(defun planning/open-current-dashboard ()
  )

(global-set-key "\M-\d" 'planning/open-today)
(global-set-key "\M-\\" 'planning/open-current-dashboard)


