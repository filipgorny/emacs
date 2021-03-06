;; cursor navigation
(defun back-to-indentation-or-beginning () (interactive)
	(if (= (point) (progn (back-to-indentation) (point)))
	    (beginning-of-line)))

(defun cur-move-up ()
  (interactive)
    (progn
      (previous-line)))

(defun cur-move-down ()
  (interactive)
  (progn
    (next-line)))

(defun cur-move-beginning ()
  (interactive)
  (beginning-of-line))

(defun cur-move-right ()
  (interactive)
  (forward-char))

(defun cur-move-left ()
  (interactive)
  (backward-char))

(defun cur-jump-up ()
  (interactive)
  (scroll-down 20))

(defun cur-jump-down ()
  (interactive)
  (scroll-up 20)
  )

(global-set-key (kbd "C-x p") 'cur-move-up)

;; common keybindings
(defvar homerow-navigation-minor-mode-map
    (let ((map (make-sparse-keymap)))
      (define-key map (kbd "M-h") 'cur-move-left)
      (define-key map (kbd "M-j") 'cur-move-down)
      (define-key map (kbd "M-k") 'cur-move-up)
      (define-key map (kbd "M-l") 'cur-move-right)
      (define-key map (kbd "C-M-l") 'forward-word)
      (define-key map (kbd "C-M-h") 'backward-word)
      (define-key map (kbd "M-d") 'end-of-line)
      (define-key map (kbd "M-a") 'cur-move-beginning)
      (define-key map (kbd "M-s") 'back-to-indentation)
      (define-key map (kbd "M-u") 'cur-jump-down)
      (define-key map (kbd "M-i") 'cur-jump-up)
      (define-key map (kbd "C-d") 'kill-whole-line)
      (define-key map (kbd "C-a") 'mark-whole-buffer)
      (define-key map (kbd "C-x j") 'end-of-buffer)
      map)
    "homerow-navigation-minor-mode keymap.")

(define-minor-mode homerow-navigation-minor-mode
  "A minor mode so that my key settings override annoying major modes."
  :init-value t
  :lighter "homerow-navigation")

(homerow-navigation-minor-mode 1)
