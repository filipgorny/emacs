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
  (emms-play-url "http://www.somafm.com/groovesalad.pls"))

;; spotify

(require-package 'helm-spotify)
