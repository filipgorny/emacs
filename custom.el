(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default)))
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(js-indent-level 4)
 '(js2-basic-offset 4)
 '(js2-bounce-indent-p t)
 '(linum-format (quote " %3d "))
 '(lsp-php-language-server-command
   (quote
    ("/usr/bin/php" "/home/filip/.emacs.d/php-language-server/vendor/bin/php-language-server.php")))
 '(lsp-php-workspace-root-detectors
   (quote
    (lsp-php-root-projectile lsp-php-root-composer-json "index.php" "robots.txt")))
 '(package-selected-packages
   (quote
    ("flycheck-phpstan" flycheck-phpstan "eglot" eglot "use-package" use-package "lsp-mode" "lsp-mode" "lsp-mode" markdown-mode "dash-functional" dash-funcional flycheck "lsp-mode" lsp-ui "lsp-php" lsp-php "popup" projectile helm php-mode auto-complete company company-mode companymode "dash-functional" "dash-funcional" dash-functional counsel-dash "dash" "org-fstree" slack "rouge-like" rouge-like key-chord key-chords "text-translator" text-translator "gradle-mode" "gradle-mode" "gradle-mode" gradle-mode bug-hunter helm-gtags ggtags gtags dumb-jump dump-jump "dump-jump" xml-rpc jira-mode web-mode emmet-mode ede-php-autoload-mode "ede-php-autoload" ede-php-autoload js2-mode litable rainbow-mode magit helm-spotify emms deft multi-term color-theme xterm-color powerline mode-icons-mode highlight-symbol workgroups2 all-the-icons hlinum "hlinum" neotree popwin pop-win direx "direx" smart-mode-line rainbow-delimiters project-explorer yaml-mode workgroups twig-mode tabbar smartparens php-auto-yasnippets perspective js3-mode highlight-parentheses helm-projectile flymake-php ac-php)))
 '(safe-local-variable-values
   (quote
    ((eval setenv "GTAGSLIBPATH"
           (concat "./src" ";" "./vendor" ";"))))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(header-line ((t :background "#333")))
 '(mode-line ((t (:foreground "#eee" :background "#111" :box nil))))
 '(mode-line-inactive ((t (:foreground "#eee" :background "#111" :box nil))))
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
