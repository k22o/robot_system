(defun my-append (lst1 lst2)
  (if (null lst1) lst2
    (cons (car lst1) (my-append (cdr lst1) lst2)))) 
  
