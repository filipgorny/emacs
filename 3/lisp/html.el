;; web-mode : for html and templates files
(add-to-list 'auto-mode-alist '("\\.tpl\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

;; twig-mode
(require-package 'twig-mode)
(add-to-list 'auto-mode-alist '("\\.html\\.twig\\'" . twig-mode))
