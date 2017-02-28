(add-to-list 'load-path "~/.emacs.d/vendor/twittering-mode")

(require 'twittering-mode)
(setq twittering-use-master-password t)

(add-hook 'twittering-mode-hook (lambda ()
                                  (linum-mode 'nil)))
