(require-package 'emms)
(require 'emms-player-simple)
(require 'emms-source-file)
(require 'emms-source-playlist)
(require 'emms-player-mplayer)
(setq emms-player-list '(emms-player-mpg321
                         emms-player-ogg123
                         emms-player-mplayer))

(defun music/play-groove-salad ()
  (interactive)
  ;;(emms-play-url "http://www.somafm.com/groovesalad.pls"))
  (emms-play-url "http://ice1.somafm.com/groovesalad-256-mp3"))

;; spotify

(require-package 'helm-spotify)

(setq music/playing 'nil)

(global-set-key (kbd "C-x C-m") '(lambda ()
                                   (interactive)
                                   (if music/playing
                                       (progn
                                         (message "Stoping music.")
                                         (setq music/playing nil)
                                         (emms-stop))
                                     (progn
                                       (message "Starting playing music...")
                                       (setq music/playing t)
                                       (music/play-groove-salad)))))

