(require-package 'tabbar)

(tabbar-mode 1)

;; theme
(set-face-attribute
 'tabbar-default nil
 :background "#222"
 :foreground "#eee"
 :box '(:line-width 1 :color "gray20" :style nil))
