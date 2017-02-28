;; do not display the "wrote.." autosave message
;; solution found here: https://github.com/ChillarAnand/real-auto-save/issues/25
(defmacro with-suppressed-message (&rest body)
  "Suppress new messages temporarily in the echo area and the `*Messages*' buffer while BODY is evaluated."
  (declare (indent 0))
  (let ((message-log-max nil))
    `(with-temp-message (or (current-message) "") ,@body)))

(with-suppressed-message (save-buffer))
;; //


