(defun fphp-resolve-block-type ()
  (interactive)
  (setq previous-position (point))
  (setq bracket-open-position (search-backward "{"))
  (setq bracket-open-position (search-forward "}"))

  )
