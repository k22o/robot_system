;(defun summit (lst)
;  (let ((x (car lst))
;	(if (null x) (summit (cdr lst))
;	(+ x (summit (cdr lst)))))))

(defun summit (lst)
    (let ((x (car lst)) (sum 0))
	(cond ((null x) (summit (cdr lst)))
	      ((null (cdr lst)) (+ x sum))
	(t (setq sum (+ x (summit (cdr lst))))))))

;展開していったときの一番最後のときの条件処理が不記載
