(defun php-assistant/find-namespace-for-file (file)
  (setq path (split-string file "/"))
  (cl-position "src" path)
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

(lambda ()

  (php-assistant/find-namespace-for-file "/home/filip/.emacs.d/tmp/php-test/src/TestPhp/PackageOne/Entity/Comment.php")
  ;(setq str "public function foo(Bar $bar, Biz $biz, $fiz)")
  ;(php-assistant/docblock-str (php-assistant/merge-new-lines (php-assistant/method-args-str str)))
)

(defun php-assistant/get-class-members ()
  (let* (
         (buffer-str (buffer-substring 1 (point-max)))
         (parts (split-string buffer-str "\n"))
         )
    (mapcar (lambda (line)
              ) parts)))

;; line parsers
