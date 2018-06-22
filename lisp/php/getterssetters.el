(defun fphp/generate-getter (name)
  (let
      (
       (type fphp/get-property-type name)
       (uppercaseName (uppercase name))
       )
      (save-excursion
        (fphp/goto-end-of-class)
        (if (type)
            (fphp/insert-docblock "@return "))
        (insert "\tpublic function get")
        (insert uppercaseName)
        (insert "()")
        (insert "\n")
  )))
