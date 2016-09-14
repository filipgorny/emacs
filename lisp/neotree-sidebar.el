(require-package 'neotree)
(setq neo-window-width 30)
(setq neo-smart-open t)

;; keybindings
(define-key neotree-mode-map (kbd "j") 'next-line)
(define-key neotree-mode-map (kbd "k") 'previous-line)
(define-key neotree-mode-map (kbd "SPC") (neotree-make-executor
					    :file-fn 'neo-open-file
					    :dir-fn  'neo-open-dir))

;; toggling focus
(defun f-sidebar-dir-switch (dir)
    (setq default-directory dir)
    (neotree-dir dir)
    (neotree-refresh))

(setq f-sidebar--prev-window nil)

(defun f-sidebar-toggle-focus ()
  (interactive)
    (if (eq (current-buffer) (get-buffer " *NeoTree*"))
	    (when f-sidebar--prev-window
		(select-window f-sidebar--prev-window))
      (progn
	(setq f-sidebar--prev-window (get-buffer-window))
	(select-window (get-buffer-window " *NeoTree*")))))

(global-set-key (kbd "M-1") 'f-sidebar-toggle-focus)

(custom-set-faces
(set-face-attribute 'neo-button-face      nil)
(set-face-attribute 'neo-file-link-face   nil)
(set-face-attribute 'neo-dir-link-face    nil :foreground "#ff0000" :weight 'bold)
(set-face-attribute 'neo-header-face      nil)
(set-face-attribute 'neo-expand-btn-face  nil)
)
