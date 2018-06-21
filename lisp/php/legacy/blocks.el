(require 'highlight)

(defun fphp-resolve-block-type ()
  (interactive)
  (setq previous-position (point))
  (setq bracket-open-position (search-backward "{"))
  (setq first-block-line (1+ (count-lines 1 (point))))

  ;(set-mark-command nil)
  (setq bracket-open-position (search-forward "}"))
  ;(setq deactivate-mark nil)
  (setq last-block-line (1+ (count-lines 1 (point))))

  (go-to-char previous-position)
  
  (hlt-highlight-lines first-block-line last-block-line 'fphp-block-face nil)
  )


(defface fphp-block-face
  '((t :foreground "black"
       :background "aquamarine"
       :weight bold
       :underline t
       ))
  "Face for function parameters."
  :group 'fphp )
