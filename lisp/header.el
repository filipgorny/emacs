(defmacro with-face (str &rest kkproperties)
  `(propertize ,str 'face (list ,@properties)))

(defun header/make-header ()
  ""
  (let* ((sl/full-header (abbreviate-file-name buffer-file-name))
         (sl/header (file-name-directory sl/full-header))
         (sl/drop-str "[...]"))
    (if (> (length sl/full-header)
           (window-body-width))
        (if (> (length sl/header)
               (window-body-width))
            (progn
              (concat (with-face sl/drop-str
                                 :background "blue"
                                 :weight 'bold
                                 )
                      (with-face (substring sl/header
                                            (+ (- (length sl/header)
                                                  (window-body-width))
                                               (length sl/drop-str))
                                            (length sl/header))
                                 ;; :background "red"
                                 :weight 'bold
                                 )))
          (concat (with-face sl/header
                             ;; :background "red"
                             :foreground "#8fb28f"
                             :weight 'bold
                             )))
      (concat (with-face sl/header
                         ;; :background "green"
                         ;; :foreground "black"
                         :weight 'bold
                         :foreground "#8fb28f"
                         )
              (with-face (file-name-nondirectory buffer-file-name)
                         :weight 'bold
                         ;; :background "red"
                         )))))

(defun header/display-header ()
  (if (not (string= (buffer-name (current-buffer)) " *NeoTree*"))
      (setq header-line-format
            '("" ;; invocation-name
              (:eval (if (buffer-file-name)
                         (header/make-header)
                       "%b")))))
    (progn
      (setq header-line-format '(:""))
      ))



(add-hook 'buffer-list-update-hook
          'header/display-header)
