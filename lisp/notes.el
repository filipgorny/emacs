(require-package 'deft)

(setq deft-directory "/home/filip/Documents/deft")

(global-set-key (kbd "<f12>") 'deft)

(setq deft-default-extension "org")
(setq deft-extensions '("org" "txt"))
(setq deft-directory "~/org")
(setq deft-recursive t)
(setq deft-use-filename-as-title nil)
(setq deft-use-filter-string-for-filename t)
(setq deft-file-naming-rules '((noslash . "-")
                               (nospace . "-")
                               (case-fn . downcase)))
(setq deft-text-mode 'org-mode)
