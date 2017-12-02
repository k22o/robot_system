(defun period_re (x)
  (if (= x 0) 'done
    (progn
     (format t ".~%")
     (period_re (- x 1)))))
