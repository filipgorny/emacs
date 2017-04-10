(set-cursor-color "#ff2")
(blink-cursor-mode 1)
(setq-default cursor-type '(bar . 3))

(defvar blink-cursor-interval-visible 0.8)
(defvar blink-cursor-interval-invisible 0.4)

(defadvice internal-show-cursor (before unsymmetric-blink-cursor-interval)
  (when blink-cursor-timer
    (setf (timer--repeat-delay blink-cursor-timer)
          (if (internal-show-cursor-p)
              blink-cursor-interval-visible
            blink-cursor-interval-invisible))))
(ad-activate 'internal-show-cursor)
