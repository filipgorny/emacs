(global-set-key (kbd "C-f") 'isearch-forward)
(define-key isearch-mode-map "\C-f" 'isearch-repeat-forward)

(defun comment-or-uncomment-region-or-line ()
  "comment or uncomment current line"
  (interactive)
  (comment-or-uncomment-region (line-beginning-position) (line-end-position))
  (next-logical-line))

;; navigation between blocks
(defun xah-forward-block (&optional Ïn)
  "Move cursor forward to the beginning of next text block.
A text block is separated by blank lines.
In most major modes, this is similar to `forward-paragraph', but this command's behavior is the same regardless of syntax table."
  (interactive "p")
  (let ((Ïn (if (null Ïn) 1 Ïn)))
    (search-forward-regexp "\n[\t\n ]*\n+" nil "NOERROR" Ïn)))

(defun xah-backward-block (&optional Ïn)
  "Move cursor backward to previous text block.
See: `xah-forward-block'"
  (interactive "p")
  (let ((Ïn (if (null Ïn) 1 Ïn))
        (Î¾i 1))
    (while (<= Î¾i Ïn)
      (if (search-backward-regexp "\n[\t\n ]*\n+" nil "NOERROR")
          (progn (skip-chars-backward "\n\t "))
        (progn (goto-char (point-min))
               (setq Î¾i Ïn)))
      (setq Î¾i (1+ Î¾i)))))

(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank))

(defvar my-keys-minor-mode-map
  (let ((map (make-sparse-keymap)))
      (define-key map (kbd "S-C-c") 'simpleclip-copy)
      (define-key map (kbd "C-v") 'simpleclip-paste)
      (define-key map (kbd "S-C-x") 'simpleclip-cut)
      (define-key map (kbd "C-a") 'mark-whole-buffer)
      (define-key map (kbd "C-x C-f") 'find-file)
      (define-key map (kbd "M-q") 'f-sidebar-focus)
      (define-key map (kbd "C-q") 'f-sidebar-toggle)
      (define-key map (kbd "C-d") 'kill-whole-line)
      (define-key map (kbd "C-z") 'undo)
      (define-key map (kbd "C-S-z") 'undo-tree-redo)
      (define-key map (kbd "C-s") 'save-buffer)
      (define-key map (kbd "M-9") 'window-left)
      (define-key map (kbd "M-0") 'window-right)
      (define-key map (kbd "M-;") 'comment-or-uncomment-region-or-line)
      (define-key map (kbd "C-c d") 'duplicate-line)
      (define-key map (kbd "C-c C-c") 'duplicate-line)
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
        (define-key map (kbd "M-n") 'xah-forward-block)
        (define-key map (kbd "M-m") 'xah-backward-block)
        map)
    "f-navigation-minor-mode keymap.")

(define-minor-mode f-navigation-minor-mode
    "A minor mode so that my key settings override annoying major modes."
    :init-value t
    :lighter "f-navigation")

(f-navigation-minor-mode 1)

(global-set-key (kbd "M-d") 'end-of-line)
(global-set-key (kbd "M-s") 'back-to-indentation)

(define-key key-translation-map (kbd "ESC") (kbd "C-g"))
