(defun typing/current-indendation-level ()
  (setq indentation-level 0)
  (let ((starting-cur-posiotion (point))
        (ilvl 0)
        (testing-limit 200))
    (progn
      (beginning-of-line)
      (if (not (while (and (> testing-limit 0) (char-equal ?\s (char-after)))
                 (progn
                   (message (concat "'" (char-to-string (char-after)) "'"))
                   (forward-char)
                   (- testing-limit 1)
                   (setq indentation-level (+ indentation-level 1)))
                 )
               )
          (symbol-value 'indentation-level)))))

(defun typing/block-start-position ()
  (let ((starting-indentation (typing/current-indendation-level)))
    (progn
      (next-line)
      (setq safety-limit 100)
      (while (and (- safety-limit (=< (typing/current-indendation-level) starting-indentation)
        (typing/current-indendation-level)
        ))))))


(defun typing/mark-current-block ()
  )

(lambda ()
      (typing/current-indendation-level)
  )
