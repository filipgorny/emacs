(defvar my-keys-minor-mode-map
  (let ((map (make-sparse-keymap)))
      (define-key map (kbd "C-i") 'some-function)
      (define-key map "\C-v" 'yank)
      (define-key map "\C-a" 'mark-whole-buffer)
      (define-key map (kbd "C-x C-p") 'projectile-switch-project)
      (define-key map (kbd "C-x C-f") 'find-file)
      (define-key map (kbd "M-q") 'f-neotree-toggle)
      (define-key map (kbd "C-q") 'f-neotree-toggle)
    map)
  "my-keys-minor-mode keymap.")

(define-minor-mode my-keys-minor-mode
  "A minor mode so that my key settings override annoying major modes."
  :init-value t
  :lighter " my-keys")

(my-keys-minor-mode 1)
