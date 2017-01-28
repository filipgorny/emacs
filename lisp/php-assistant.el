(defun php-assistant/find-namespace-for-file (file)
  (setq path (split-string file "/"))
  (cl-position "src" path)
  )

(lambda ()
  (message (php-assistant/find-namespace-for-file (buffer-file-name)))
  )
