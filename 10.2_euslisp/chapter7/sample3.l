(defmacro my-popback (a)
  `(let ((x a))
     (while (consp (cddr x)) (setq x (cdr x)))
     (prog1 (cadr x) (setf (cdr x) nil))))

(defmacro my-push (x a)
  `(setf ,a (cons ,x ,a)))

(defmacro my-pop (a)
  `(let ((x (car ,a)))
     (setf ,a (cdr,a)) x))
