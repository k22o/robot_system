(defun summit (lst)
 (progn
  (setq lst (remove nil lst))
  (apply #'+ lst)))
  
