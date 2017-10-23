(require-package 'dash)

;; plan:
;; - znalezc wszystkie zaimportowane klasy
;; - znalezc wystapienia klas 

;; collecting class info

(setq php-classes-info ())

(defun php-class-info/full-key (class key)
  (concat class " - " key))

(defun php-class-info/store (class key value)
  (let ((full-key (php-class-info/full-key class key)))
    (add-to-list 'php-classes-info (cons full-key value))))

(defun php-class-info/get (class key)
  (alist-get (php-class-info/full-key class key) php-classes-info)) ;; ?? to trzeba poprawic bo nie dziala

;; parsing

(defun php-parser/parse-class-line (line)
  (message (concat "parsuje sobie linijke z klasa: " line)))

(setq php-parser/line-parsers '(
                                ("^class\\\s\\\w+\\\s?" . "php-parser/parse-class-line"))
                                )

;(defun php-parser/parse-class ()
;  (interactive)
;  (let* (
;         (buffer-str (buffer-substring 1 (point-max)))
;         (parts (split-string buffer-str "\n"))
;         )
;    (mapcar (lambda (line)
;              (mapcar (lambda (parsing-function)
;                        (let* ((pattern (car parsing-function)))
;                          (when (string-match pattern line)
;                            (funcall (intern (cdr parsing-function)) line))
;                          ))
;                      php-parser/line-parsers))
;              parts)
 ;   ))

;; navigation between the OOP elements

(defun php-navigation/get-root-directory ()
  (if (and (boundp 'projects/current-project-directory) projects/current-project-directory)
      projects/current-project-directory))

(defun php-navigation/call-php-helper (method param)
  (shell-command-to-string (concat "php ~/.emacs.d/php/composer_class_finder.php " (php-navigation/get-root-directory) " " method " " (regexp-quote param))))
  
(defun php-navigation/find-class-file (class)
  (php-navigation/call-php-helper "find-class" class))

(defun php-navigation/find-classes (word)
  )

;; php fill the basics
(defun php-fill/resolve-namespace (file)
  (progn
    (setq removes '("src" "vendor" ".php"))
    (add-to-list 'removes (php-fill/package-root-directory))
    (mapcar (lambda (str)
            (setq file (replace-regexp-in-string str "" file))) removes)
    (string-join (split-string file "/") "\\")))

(defun php-fill/class-template ()
  (let* ((namespace (php-fill/resolve-namespace (php-fill/current-file))))))

(defun php-fill/current-file ()
  "/home/filip/Projects/aspello/gis/src/Aspello/DocumentsBundle/Entity/Document.php")

(defun php-fill/package-root-directory ()
  (locate-dominating-file default-directory "composer.json"))

;; testing playground

(defun print-elements-of-list (list)
  "Print each element of LIST on a line of its own."
  (while list
    (print (car list))
    (setq list (cdr list))))


(lambda ()
  (php-fill/resolve-namespace (php-fill/current-file))


  ;; (progn
  ;;   (php-class-info/store "Document" "use" '("test" "ddd"))
  ;;   (message (php-class-info/get "Document" "use"))
  ;;   (print-elements-of-list php-classes-info))
  
  ;; (php-parser/parse-class)
  ;; (string-match-p "^class\\\s\\\w+\\\s?" "class LayerController extends Controller")
  ;; (string-match "^class\\\s\\w+" "class LayerController extends Controller")
  ;; (message (php-navigation/find-class-file "Aspello\\\TemplatesBundle\\\Entity\\\DocumentTemplate")))
