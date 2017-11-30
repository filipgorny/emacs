(defun testapi/close ()
  (interactive)
  (kill-buffer (current-buffer))
  )

(define-minor-mode testapi-mode
      ;; The initial value.
      nil
      ;; The indicator for the mode line.
      " TestApi"
      ;; The minor mode bindings.
      '(("q" . testapi/close))
      :group nil)

(setq testapi/buffer nil)

(defun testapi/run (url)
  (if (not testapi/buffer)
      (setq testapi/buffer (make-temp-name "testapi"))
      )
  ;;(setq url "http://dev.fintechsolutions.pl:8091/start/bluemedia?subject=test&subjectId=3&amount=34&currency=PLN")
  ;;(setq localurl "http://php-docker.local:8080/start/bluemedia?subject=test&subjectId=3&amount=34&currency=PLN")

  (setq wgetcommand (concat "wget -qO - \"" localurl "\""))

  (switch-to-buffer testapi/buffer)
  
  (insert (shell-command-to-string wgetcommand))
  (insert "\n------------------------------------------------------------------------------------------------------------\n")
  )
  
(testapi/run)
