(setq ansi-color-names-vector
      ["black" "chartreuse" "PaleGreen2" "gold1"
       "DeepSkyBlue1" "MediumOrchid1" "cyan" "white"])

(setq system-uses-terminfo nil)
(setq term-buffer nil)

(defun f-side-terminal-open ()
    "Create or visit a terminal buffer."
    (interactive)
    (if (not term-buffer)
            (progn
                (setq t-current-window (get-buffer-window (current-buffer)))
                (setq t-current-buffer (current-buffer))
                (setq term-buffer (generate-new-buffer "shell"))
                (shell term-buffer)
                (select-window t-current-window)
                (switch-to-buffer t-current-buffer))
	(f-toggle-side-window term-buffer)))

(global-set-key "\M-\d" 'f-side-terminal-open)

(define-key comint-mode-map (kbd "<up>") 'comint-previous-input)
(define-key comint-mode-map (kbd "<down>") 'comint-next-input)
