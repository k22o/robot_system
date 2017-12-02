;;;選択ソート

(defun selection-sort (l)
  (labels ((min-list (l)
		     (let ((best (cal l)))
		       (dolist (el l best)
			 (if (<= el best) (setq best el))))))
	  (do* ((so-far nil (push (min-list lis) so-far))
		(lis l (remove (min-list lis) lis :count 1)))
	       ((null lis) (reverse so-far)))))

;;;クイックソート
(defun quick-sort (l)
  (if (null l) nil
    (labels ((bigger-el (x) (>= x (car l))))
	    (let ((smaller (remove-if #'bigger-el (cdr l)))
		  (bigger (remove-if-not #'bigger-el (cdr l))))
	      (append (quick-sort smaller) (list (car l)) (quick-sort bigger))))))
