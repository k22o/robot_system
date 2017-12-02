(defun period_iter (x)
  (if (= x 0) (format t "~%")
    (do ((i 1 (+ i 1)))
	((> i x) 'done)
	(format t ".~%"))))
	 
