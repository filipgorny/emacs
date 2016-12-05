(require-package 'neotree)
(require-package 'all-the-icons)

(setq neo-theme (if (display-graphic-p) 'icons))
(neotree-toggle)

(setq sidebar-buffer-name " *NeoTree*")

(defun sidebar-get-window ()
    (get-buffer-window sidebar-buffer-name))

(defun sidebar-disable-mode-line ()
  (setq previous-window (get-buffer-window))
  (select-window (sidebar-get-window))
  (setq mode-line-format nil)
  (select-window previous-window))

(defun sidebar-disable-linum ()
  (setq previous-window (get-buffer-window))
  (select-window (sidebar-get-window))
  (linum-mode -1)
  (select-window previous-window))

(sidebar-disable-mode-line)
(sidebar-disable-linum)

(defun sidebar-toggle-focus ()
  (interactive)
  (if (eq (current-buffer) (get-buffer sidebar-buffer-name))
      (other-window 1)
    (select-window (sidebar-get-window))))

(global-set-key (kbd "M-q") 'sidebar-toggle-focus)

(defun sidebar-update-style ()
  (setq sidebar-font-size 100)

  (setq sidebar-color-dir "#22aa22")

  (setq neo-window-width 34)
  (neotree-toggle)
  (neotree-toggle)

  (custom-set-faces
   (set-face-attribute 'neo-button-face      nil :height sidebar-font-size)
   (set-face-attribute 'neo-file-link-face   nil :height sidebar-font-size)
   (set-face-attribute 'neo-dir-link-face    nil :height sidebar-font-size :foreground sidebar-color-dir :weight 'bold)
   (set-face-attribute 'neo-header-face      nil :height sidebar-font-size)
   (set-face-attribute 'neo-expand-btn-face  nil :height sidebar-font-size :foreground "#fff")
   )
  )

(sidebar-update-style)

(defun sidebar-open-project-dir ()
  "Open NeoTree using the git root."
  (interactive)
  (let ((project-dir (projectile-project-root))
	(file-name (buffer-file-name)))
    (if project-dir
	    (progn
	      (neotree-dir project-dir))))
	      ;(neotree-find file-name))))
  (message "Could not find git project root."))

;;(setq projectile-switch-project-action 'sidebar-open-project-dir)
