(defun wget (url)
  (setq wgetcommand (concat "wget -qO - \"" localurl "\""))
  (shell-command-to-string wgetcommand))
  
