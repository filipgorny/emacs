(global-set-key (kbd "C-f") 'isearch-forward)
(define-key isearch-mode-map "\C-f" 'isearch-repeat-forward)

(defvar my-keys-minor-mode-map
  (let ((map (make-sparse-keymap)))
      (define-key map (kbd "S-C-c") 'simpleclip-copy)
      (define-key map (kbd "C-v") 'simpleclip-paste)
      (define-key map (kbd "S-C-x") 'simpleclip-cut)
      (define-key map (kbd "C-a") 'mark-whole-buffer)
      (define-key map (kbd "C-x C-p") 'projectile-switch-project)
      (define-key map (kbd "C-x C-f") 'find-file)
      (define-key map (kbd "M-q") 'f-sidebar-focus)
      (define-key map (kbd "C-q") 'f-sidebar-toggle)
      (define-key map (kbd "C-d") 'kill-whole-line)
      (define-key map (kbd "C-z") 'undo)
      (define-key map (kbd "C-S-z") 'undo-tree-redo)
      (define-key map (kbd "C-s") 'save-buffer)
      (define-key map (kbd "M-9") 'window-left)
      (define-key map (kbd "M-0") 'window-right)
    map)
  "my-keys-minor-mode keymap.")

(define-minor-mode my-keys-minor-mode
  "A minor mode so that my key settings override annoying major modes."
  :init-value t
  :lighter "my-keys")

(my-keys-minor-mode 1)

(defvar f-navigation-minor-mode-map
    (let ((map (make-sparse-keymap)))
        (define-key map (kbd "M-h") 'backward-char)
        (define-key map (kbd "M-j") 'next-line)
        (define-key map (kbd "M-k") 'previous-line)
        (define-key map (kbd "M-l") 'forward-char)
        (define-key map (kbd "M-d") 'end-of-line)
        (define-key map (kbd "M-a") 'beginning-of-line)
        (define-key map (kbd "M-s") 'back-to-indentation)
        map)
    "f-navigation-minor-mode keymap.")

(define-minor-mode f-navigation-minor-mode
    "A minor mode so that my key settings override annoying major modes."
    :init-value t
    :lighter "f-navigation")

(f-navigation-minor-mode 1)

(global-set-key (kbd "M-d") 'end-of-line)
(global-set-key (kbd "M-s") 'back-to-indentation)
