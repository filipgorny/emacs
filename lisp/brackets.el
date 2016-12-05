(require-package 'rainbow-delimiters)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
(custom-set-faces
 '(rainbow-delimiters-depth-1-face ((t (:foreground "#ffaa00"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "#99ff99"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "#aa88ff"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "#88ffff"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "#88ff00"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "#ffff66"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "#44ff44"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "#22ff22"))))
 '(rainbow-delimiters-depth-9-face ((t (:foreground "#00ff00"))))
 '(rainbow-delimiters-unmatched-face ((t (:foreground "red"))))
 '(show-paren-match ((((class color) (background light)) (:background "azure2")))))

(require-package 'highlight-parentheses)
(global-highlight-parentheses-mode t)
