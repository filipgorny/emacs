(defun get-random-element (list)
  "Returns a random element of LIST."
  (if (not (and (list) (listp list)))
      (nth (random (1- (1+ (length list)))) list)
    (error "Argument to get-random-element not a list or the list is empty")))

(setq colors '(
	       "blue"
	       "green"
	       "red"))

(defun get-random-color ()
  (get-random-element colors))

(global-set-key (kbd "C-x 0") '(progn
				 (set-background-color (get-random-color))))


;; przydaloby sie generowanie koloru na podstawie namespacu ale pomijajac czesci ktore sie nigdy nie zmieniaja + dobierac kolor na bazzie
;; calych slow a nie znakow
