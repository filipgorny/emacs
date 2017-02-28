(require-package 'web-mode)

;; web-mode : for html and templates files
(add-to-list 'auto-mode-alist '("\\.tpl\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

;; twig-mode
(require-package 'twig-mode)
(add-to-list 'auto-mode-alist '("\\.html\\.twig\\'" . twig-mode))

(setq web-mode-tag-auto-close-style 1)
(setq web-mode-enable-auto-pairing t)
(setq web-mode-enable-css-colorization t)
(setq web-mode-markup-indent-offset 4)

;; theme
(add-hook 'web-mode-hook '(lambda ()
                            (set-face-attribute 'web-mode-html-attr-value-face nil :foreground "indian red")
                            (set-face-attribute 'web-mode-html-attr-name-face nil :foreground "firebrick")))
