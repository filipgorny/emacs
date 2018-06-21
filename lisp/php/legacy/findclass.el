(require 'cl-lib)

(defun fphp-find-class (name &optional is-interface)
  (let* (
         ;;(sourcedirectory "panel/symfony-app/src/")
         (sourcedirectory "")
         (classname name)
         ;(setq is-interface nil)
         ;(setq classname "NotificationService")
         ;;(command (concat "grep -r \"" (if is-interface "interface" "class") " " classname " \" " projects/current-project-directory sourcedirectory))
         (command (concat "grep -r \"" "class" " " classname " \" " projects/current-project-directory sourcedirectory))j
         (grepresults (shell-command-to-string command))
         (results (split-string grepresults "\n"))
         )
    ;;(progn
    ;;(message command)
    ;;(message grepresults))))

     ;;(cl-remove-if (lambda (el) (string-equal "" el)) (mapcar (lambda (result)
    ;;(first (split-string result ":"))) results))
    (message results)))

(defun fphp-jump-to-class (name)
  (interactive)
  (find-file (helm :sources (helm-build-sync-source "test"
                   :candidates (fphp-find-class name))
        :buffer "*helm sync source*")
  ))

(defun fphp-add-use-statement (classname)
  (message (fphp-find-class "Request")))

(lambda ()
  "testing"

  (fphp-find-class "TestCase")
  (fphp-jump-to-class "InviteManager")
  (fphp-class "RegistrationData" (
                                  (implement "DtoInterface")
                                  (private 'firstName getter setter)))
  )

