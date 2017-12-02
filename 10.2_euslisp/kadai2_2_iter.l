(defun counter-a (lst)
  (let ((count 0) (end (length lst)))
       (do ((i 0 (+ i 1)))
	   ((> i end) (format t "~A~%" count))
	(progn
	  (if (equal (car lst) 'a)
	      (setq count (+ count 1))
	    (setq count (+ count 0)))
	  (setq lst (cdr lst))))))


	    
