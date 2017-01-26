(let ((buffers (remove-if (lambda (b)
			    (or (string= (substring b 0 1) "*") (string= (substring b 0 2) " *")))
			  (mapcar (lambda (b)
				    (buffer-name b))
				  (buffer-list))))
  (current-buffer-position (cl-position (buffer-name (current-buffer)) buffers))))

(global-set-key (kbd "<mouse-8>") 'previous-buffer)
(global-set-key (kbd "<mouse-9>") 'next-buffer)
