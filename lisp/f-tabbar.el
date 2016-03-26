(require-package 'tabbar)
(require 'tabbar)

(tabbar-mode t)

;; Tabbar settings
(set-face-attribute
 'tabbar-default nil
 :background "#000"
 :foreground "#eee"
 :box '(:line-width 1 :color "gray20" :style nil))
(set-face-attribute
 'tabbar-unselected nil
 :background "#111111"
 :foreground "#666666"
 :box '(:line-width 3 :color "#000" :style nil))
(set-face-attribute
 'tabbar-selected nil
 :background "#0c0c0c"
 :foreground "#fff"
 :box '(:line-width 5 :color "#0c0c0c" :style nil))

(set-face-attribute
 'tabbar-button nil
 :box '(:line-width 1 :color "#000" :style nil))
