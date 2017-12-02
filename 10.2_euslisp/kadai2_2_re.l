(defun counter-a (lst)
  (let ((counter 0))
    (if (null (cdr lst))
	(if (equal (car lst) 'a) 1 0)
      (if (equal (car lst) 'a)
	  (+ 1  (counter-a (cdr lst)))	
	(counter-a (cdr lst))))))


	   
