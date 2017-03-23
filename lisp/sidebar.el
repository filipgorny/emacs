(require-package 'neotree)
(require-package 'all-the-icons)

;;(setq neo-theme (if (display-graphic-p) 'icons))
(setq neo-theme (if (display-graphic-p) 'arrow))

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

(defun sidebar-toggle-focus ()
  (interactive)
  (if (eq (current-buffer) (get-buffer sidebar-buffer-name))
      (other-window 1)
    (select-window (sidebar-get-window))))

(defun sidebar-update-style ()
  (setq sidebar-font-size 100)

  (setq neo-window-width 38)
  (neotree-toggle)
  (neotree-toggle)

  (setq line-spacing 3)

  (custom-set-faces
   (set-face-attribute 'neo-button-face      nil :height sidebar-font-size :foreground "#222" :background "#090909")
   (set-face-attribute 'neo-file-link-face   nil :height sidebar-font-size :foreground "#bbb" :background "#090909")
   (set-face-attribute 'neo-dir-link-face    nil :height sidebar-font-size :foreground "#555" :weight 'bold :background "#090909")
   (set-face-attribute 'neo-header-face      nil :height sidebar-font-size)
   (set-face-attribute 'neo-expand-btn-face  nil :height sidebar-font-size :foreground "#666")
   )
  )

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

(neotree-show)

(sidebar-disable-mode-line)
(sidebar-disable-linum)

(sidebar-update-style)

(global-set-key (kbd "M-q") 'sidebar-toggle-focus)

;; keys
(progn
  (define-key neotree-mode-map (kbd "k") 'neotree-previous-line)
  (define-key neotree-mode-map (kbd "j") 'neotree-next-line)
  (define-key neotree-mode-map (kbd "M-k") 'neotree-previous-line)
  (define-key neotree-mode-map (kbd "M-j") 'neotree-next-line))

;; overwrite a built in function to remove the unwanted headers

(defun neo-buffer--insert-root-entry (node)
  ())

;; cursor

(defun sidebar/enable-line-cursor ()
  (interactive)
  (setq cursor-type 
  ))

(defun sidebar/disable-line-cursor ()
  (interactive)
  )

(add-hook 'neotree-mode-hook
          (lambda ()
            (setq cursor-type 'nil)
            ))

(global-set-key (kbd "S-C-q") 'neotree-toggle)
