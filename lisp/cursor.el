(defvar blink-cursor-colors (list  "#ffff00" "#ffdd00" "#ffbb00" "#ff9900" "#ff6600" "#ff9900" "#ffbb00" "#ffdd00")
  "On each blink the cursor will cycle to the next color in this list.")

(setq blink-cursor-count 0)
(defun blink-cursor-timer-function ()
  "Zarza wrote this cyberpunk variant of timer `blink-cursor-timer'.
Warning: overwrites original version in `frame.el'.

This one changes the cursor color on each blink. Define colors in `blink-cursor-colors'."
  (when (not (internal-show-cursor-p))
    (when (>= blink-cursor-count (length blink-cursor-colors))
      (setq blink-cursor-count 0))
    (set-cursor-color (nth blink-cursor-count blink-cursor-colors))
    (setq blink-cursor-count (+ 1 blink-cursor-count))
    )
  (internal-show-cursor nil (not (internal-show-cursor-p)))
  )

(blink-cursor-mode 1)
(setq cursor-type '(bar . 3))

(defvar blink-cursor-interval-visible 1)
(defvar blink-cursor-interval-invisible 0.001)

(defadvice internal-show-cursor (before unsymmetric-blink-cursor-interval)
  (when blink-cursor-timer
    (setf (timer--repeat-delay blink-cursor-timer)
          (if (internal-show-cursor-p)
              blink-cursor-interval-visible
            blink-cursor-interval-invisible))))
(ad-activate 'internal-show-cursor)
