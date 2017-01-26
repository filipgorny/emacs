;;(require-package 'projectile)
;;(require-package 'helm-projectile)
;;(require-package 'workgroups2)
;;(workgroups-mode 1)
;;(setq wg-session-file "~/.emacs.d/.emacs_workgroups")
;; (setq projectile-completion-system 'helm)
;; (projectile-mode)

;; (setq projects/sessions-dir "/home/filip/.emacs.d/projects-data/")
;; (setq projects/current-directory nil)

;; (setq projectile-switch-project-action '(lambda ()
;; 					  (setq projects/current-directory default-directory)
;; 					  (neotree-dir default-directory)
;; 					  (other-window 1)
;; ;;					  (wg-switch-to-workgroup projects/current-directory)
;; 					  ))

;; (defun projects/switch ()
;;   (interactive)
;;   (if projects/current-directory
;;       (progn
;;   	(neotree-hide)
;;   ;;	(wg-save-session)
;;   	(neotree-show)
;; 	(message "Session saved")))
;;   (projectile-switch-project))

;; keys binding

;(define-key projectile-mode-map (kbd "C-x p") 'projects/switch)
;(define-key projectile-mode-map (kbd "C-x C-p") 'projects/switch)

;; use story
;;(message
;; "
;; - otwieram liste projektow na podstawie .git w ~/Projects
;; - gdy jestem podczas edycji projektu, przechowuje dane o:
;; -- otworzonych plikach
;; ")

(setq projects/current-project nil)

(defun projects/open-new ()
  (interactive)
  (setq projects (mapcar (lambda (source)
			    (replace-regexp-in-string ".git" "" source))
			  (split-string
			   (shell-command-to-string "find /home/filip/Projects -name .git -type d -prune -maxdepth 3"))))
    (setq helm-projects-source
	  '((name . "Projects catalog")
	    (candidates . projects)
	    (action . (lambda (candidate)
			(setq projects/current-project-directory candidate)
			(neotree-dir projects/current-project-directory)
			(other-window 1)
			))))
  (helm :sources helm-projects-source))

(lambda () (projects-catalog-list))

(global-set-key (kbd "C-x C-p") 'projects/open-new)
(global-set-key (kbd "C-x p") 'projects/open-new)
