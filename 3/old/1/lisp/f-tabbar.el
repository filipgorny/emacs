(require-package 'tabbar)
(require 'tabbar)

(tabbar-mode t)

;; Tabbar settings
(set-face-attribute
 'tabbar-default nil
 :background "#000"
 :foreground "#eee"
 :box '(:line-width 1 :color "gray20" :style nil))
(set-face-attribute
 'tabbar-unselected nil
 :background "#111111"
 :foreground "#666666"
 :box '(:line-width 3 :color "#000" :style nil))
(set-face-attribute
 'tabbar-selected nil
 :background "#0c0c0c"
 :foreground "#fff"
 :box '(:line-width 5 :color "#0c0c0c" :style nil))

(set-face-attribute
 'tabbar-button nil
 :box '(:line-width 1 :color "#000" :style nil))

(defun f-tabbar--buffer-groups () ;; customize to show all normal files in one group
   "Returns the name of the tab group names the current buffer belongs to.
 There are two groups: Emacs buffers (those whose name starts with '*', plus
 dired buffers), and the rest.  This works at least with Emacs v24.2 using
 tabbar.el v1.7."
   (list (cond ((string-equal "*" (substring (buffer-name) 0 1)) "system")
               ((eq major-mode 'dired-mode) "system")
	       ((eq (buffer-name) "shell") "system")
               (t "code"))))

(setq tabbar-buffer-groups-function 'f-tabbar--buffer-groups)
