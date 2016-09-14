(require-package 'jedi)

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

(if nil ;; todo - make it detect if jedi server is installed
    (jedi:install-server))
