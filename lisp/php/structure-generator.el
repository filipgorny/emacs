(defun parse-org-list ()
  (setq previous-level 0)
  (setq elements '("dd"))
  (setq currentlinebody (string-trim-right (thing-at-point 'line 't)))
  (setq currentlinetrimed (string-trim-left currentlinebody))
  (setq indentation-level (- (length currentlinebody) (length currentlinetrimed)))

  (if (> indentation-level previous-level)
      (parse-sub-list ) ; recursive this method and add firstline parameter
      )
  
  (add-to-list 'elements currentlinetrimed)
        
      
  (message currentlinebody)
  (while ()))
