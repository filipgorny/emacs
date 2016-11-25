;; cursor navigation
(defun back-to-indentation-or-beginning () (interactive)
	(if (= (point) (progn (back-to-indentation) (point)))
	    (beginning-of-line)))

(defun cur-move-up ()
  (interactive)
    (progn
      (previous-line)
      (back-to-indentation)))

(defun cur-move-down ()
  (interactive)
  (progn
    (next-line)
    (back-to-indentation)))

(defun cur-move-beginning ()
  (interactive)
  (beginning-of-line))

(global-set-key (kbd "C-x p") 'cur-move-up)

;; common keybindings
(defvar homerow-navigation-minor-mode-map
    (let ((map (make-sparse-keymap)))
      (define-key map (kbd "M-h") 'backward-char)
      (define-key map (kbd "M-j") 'cur-move-down)
      (define-key map (kbd "M-k") 'cur-move-up)
      (define-key map (kbd "M-l") 'forward-char)
      (define-key map (kbd "M-d") 'end-of-line)
      (define-key map (kbd "M-a") 'cur-move-beginning)
      (define-key map (kbd "M-s") 'back-to-indentation)
      (define-key map (kbd "M-=") 'next-buffer)
      (define-key map (kbd "M--") 'previous-buffer)
      (define-key map (kbd "M-u") '(lambda () (scroll-down 20)))
      (define-key map (kbd "M-i") '(lambda () (scroll-up 20)))
      (define-key map (kbd "M-w") '(lambda () (forward-word)))
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
