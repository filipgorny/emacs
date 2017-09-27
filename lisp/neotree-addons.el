(setq neo-dir-link-custom-face nil)
(copy-face 'neo-dir-link-custom-face 'neo-dir-link-face)

(defun neo-buffer--insert-dir-entry (node depth expanded)
  (let ((node-short-name (neo-path--file-short-name node)))
    (insert-char ?\s (* (- depth 1) 2)) ; indent
    (when (memq 'char neo-vc-integration)
      (insert-char ?\s 2))
    (neo-buffer--insert-fold-symbol
     (if expanded 'open 'close) node)
    (insert-button (concat node-short-name "/")
                   'follow-link t
                   'face neo-dir-link-custom-face
                   'neo-full-path node
                   'keymap neotree-dir-button-keymap
                   'help-echo (neo-buffer--help-echo-message node-short-name))
    (neo-buffer--node-list-set nil node)
    (neo-buffer--newline-and-begin)))
