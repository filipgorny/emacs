;;(add-hook 'find-file-hook 'php-generator/hook-starter)

(defun php-generator/hook-starter ()
  (when (string= (file-name-extension buffer-file-name) "php")
    (if (= (buffer-size buffer) 0)
        (php-generator/create-class-body buffer-file-name))))

(defun php-generator/create-class-body (file-name)
  (setq plines '())
  (add-to-list 'plines "<?php")
  (add-to-list 'plins "\n")
  (string-join plines "\n"))

(lambda ()
  (php-generator/create-class-body "~/Projects/aspello/gis/src/Aspello/TemplatesBundle/Controller/TemplatesController.php")
  )
