(defun test (i j) (* i j))

(setq i 3)
(setq j 2)
(if (> (test i j) 5) (print ">5")
       (print "<=5"))
