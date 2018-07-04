(defun fphp/create-constructor-select-properties ()
  (let (properties '())
    (save-excursion
      (goto-char (point-min))
      (next-line)
      (while (re-search-forward "private \$[A-Za-z_+]+\;" nil t)
        (add-to-list 'properties (string-clear '(" " "\n" ";" "private") (get-current-line)))
        ))
    (helm :sources '(((name . "HELM")
                      (candidates . properties)
                      (action . fphp/create-constructor-marked-candidates)
                      )))
    ))


(defun fphp/create-constructor-marked-candidates (candidate)
  (message "action")
  (insert "public function __construct(")
  ;;(insert (string-join (helm-marked-candidates) ", "))
  (setq properties '())
  (mapcar (lambda (candidate)
            (add-to-list 'properties (string-trim (concat (fphp/get-property-type candidate) " " candidate)))
            ) (helm-marked-candidates))
  (insert (string-join properties ", "))
  (insert ")\n\s\s\s\s{\n")
  (mapcar (lambda (el)
             (insert (concat "\s\s\s\s\s\s\s\s$this->" (string-replace "$" "" el) " = " el ";\n"))
             ) (helm-marked-candidates))
  (insert "\s\s\s\s}")
  )

(eval-after-load "php-mode"
  '(progn
     (define-key php-mode-map  (kbd "C-c k") 'fphp/create-constructor-select-properties)
  ))
