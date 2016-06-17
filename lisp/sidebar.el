(require-package 'direx)

(define-key direx:direx-mode-map (kbd "h") 'backward-char)
(define-key direx:direx-mode-map (kbd "j") 'next-line)
(define-key direx:direx-mode-map (kbd "k") 'previous-line)
(define-key direx:direx-mode-map (kbd "l") 'forward-char)
(define-key direx:direx-mode-map (kbd "SPC") 'direx:toggle-item)
(define-key direx:direx-mode-map (kbd "RET") 'sidebar/enter-item)

(global-set-key (kbd "M-q") 'sidebar/toggle-focus)

(setq sidebar/window nil)
(setq sidebar/project-root)
(setq sidebar/screen-window)
(setq sidebar/buffer nil)
(setq sidebar/root-node nil)


(defun sidebar/goto-project-root ()
  (interactive)
  (setq sidebar/project-root (projectile-project-root))
  (select-window sidebar/window)
  (set-window-dedicated-p sidebar/window nil)
  (setq sidebar/buffer (direx:find-directory sidebar/project-root))
  (linum-mode -1)
  (set-window-dedicated-p sidebar/window t)
  (select-window sidebar/screen-window))

(defun sidebar/enter-item ()
  (interactive)
  (let ((item (direx:item-at-point)))
       (select-window sidebar/screen-window)
       (direx:find-item item)))

(defun sidebar/focus ()
  (interactive)
  (select-window sidebar/window))

(defun sidebar/toggle-focus ()
  (interactive)
  (if (eq (selected-window) sidebar/window)
      (select-window sidebar/screen-window)
    (select-window sidebar/window)))

(defclass sidebar/node (direx:tree)
  ((full-name :initarg :full-name
              :accessor direx:file-full-name)
   (name :initarg :name
	 :accessor direx:tree-name)
   (treec :initarg :tree
	 :accessor direx:item-tree)))

(defclass sidebar/node-bookmark (direx:file)
  ())

(defun sidebar/create-sidebar-buffer ()
  (let ((buffer (direx:make-buffer sidebar/root-node)))
    buffer))

(defun sidebar/create-root-node ()
  (make-instance 'sidebar/node :name "home" :full-name "home"))

(defun sidebar/create-node (name)
  (make-instance 'sidebar/node :name name :full-name name :tree sidebar/root-node))

(defun sidebar/item-insert (item)
  (let ((start (point))
        (buffer-read-only nil))
    (insert (direx:item-render item))
    (direx:item-make-overlay item start (point))
    item))

(defun sidebar/item-insert-children (item)
  (let ((children (direx:make-item-children item)))
    (setf (direx:item-children item) children)
    (save-excursion
      (goto-char (overlay-end (direx:item-overlay item)))
      (dolist (child children)
        (direx:item-insert child)))))

(defun sidebar/initialize ()
  (interactive)
  (if (window-live-p sidebar/window)
      (progn
	(delete-window sidebar/window)
	(setq sidebar/window nil)))
  (sidebar/open)
  (direx:add-root-into-buffer sidebar/root-node sidebar/buffer)
  (setq sidebar/bookmark (sidebar/create-node "test"))
  (sidebar/item-insert-children 'sidebar/bookmark))

(defun sidebar/open ()
  (interactive)
  (if (not (window-live-p sidebar/window))
      (progn
	(setq sidebar/buffer-before (current-buffer))
	(setq sidebar/root-node (sidebar/create-root-node))
	(setq sidebar/buffer (sidebar/create-sidebar-buffer))
	(setq sidebar/screen-window (split-window-right))
	(setq sidebar/window (selected-window))
	(adjust-window-trailing-edge (selected-window) (- 30 (window-width)) t)
	(switch-to-buffer sidebar/buffer)
	(set-window-dedicated-p sidebar/window t)
	(linum-mode -1)
	(select-window sidebar/screen-window)
	(switch-to-buffer sidebar/buffer-before)
	)))

(sidebar/open)
(sidebar/initialize)
