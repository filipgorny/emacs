(defun php-assistant/find-namespace-for-file (file)
  (setq path (split-string file "/"))
  (cl-position "src" path)
  )

(lambda ()
  (message (php-assistant/find-namespace-for-file (buffer-file-name)))
  )

(defun php-assistant/current-line ()
  (thing-at-point 'line t))

(defun php-assistant/current-line-methodp ()
  (php-assistent/string-methodp (php-assistent/current-line)))

(defun php-assistant/string-methodp (str)
  (interactive)
  (string-match "\\(public\\|private\\)\\s-\\(function\\)" str))

(defun php-assistant/method-args-str (methodstr)
  (mapcar
   (lambda (methodarg)
     (if (not (string-match-p (regexp-quote "\s") methodarg))
         (concat "mixed " methodarg)
       methodarg
     ))
   (mapcar 'php-assistant/trim
          (split-string (substring methodstr (+ 1 (string-match "(" methodstr)) (string-match ")" methodstr)) ","))))

(defun php-assistant/docblock-str (str)
  (let ((parts (split-string str "\n")))
    (mapconcat 'identity
     (append
      (append '("/**")
              (mapcar (lambda (x)
                        (if (///////// jesli count 1 to dodaj mixed
                        (concat " * @param " x)) parts)) '(" **/")) "\n")))))

(defun php-assistant/merge-new-lines (lst)
  (mapconcat 'identity lst "\n"))

(defun php-assistant/trim (str)
  (replace-regexp-in-string (rx (or (: bos (* (any " \t\n")))
                                    (: (* (any " \t\n")) eos)))
                            ""
                            str))

(progn

  ;(setq str "public function foo(Bar $bar, Biz $biz, $fiz)")
  ;(php-assistant/docblock-str (php-assistant/merge-new-lines (php-assistant/method-args-str str)))
)
