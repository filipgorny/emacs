(setq name "test")

(defun fphp/generate-getter (name)
  (let
      (
       (type (fphp/get-property-type name))
       (uppercaseName (capitalize name))
       )
      (save-excursion
        (fphp/goto-end-of-class)
        (insert "\n\n")
        ;;(if type
        ;;    (fphp/insert-docblock (concat "@return " type)))
        (insert "\tpublic function get")
        (insert uppercaseName)
        (insert "()")
        (insert "\n\t{\n")
        (insert (concat "\t\treturn $this->" name ";\n"))
        (insert "\t}")
  )))

(defun fphp/generate-setter (name)
  (let
      (
       (type (fphp/get-property-type name))
       (uppercaseName (capitalize name))
       )
      (save-excursion
        (fphp/goto-end-of-class)
        (insert "\n\n")
        ;;;(if type
            ;;(fphp/insert-docblock (concat "@return " type)))
        (insert "\tpublic function set")
        (insert uppercaseName)
        (insert (concat "($" name ")"))
        (insert "\n\t{\n")
        (insert (concat "\t\t$this->" name " = $" name ";\n"))
        (insert "\t}")
  )))


(defun fphp/generate-getter-at-point ()
    (interactive)
    (fphp/generate-getter (current-word)))

(defun fphp/generate-setter-at-point ()
    (interactive)
    (fphp/generate-setter (current-word)))

(eval-after-load "php-mode"
  '(progn
     (define-key php-mode-map  (kbd "C-c g") 'fphp/generate-getter-at-point)
     (define-key php-mode-map  (kbd "C-c s") 'fphp/generate-setter-at-point)
  ))
