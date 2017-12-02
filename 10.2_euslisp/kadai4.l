(defclass rat
  :super propertied-object
  :slots (numer denom))

(defmethod rat
  (:init
   (n d)
   (send self :setNumer n)
   (send self :setDenom d)
   self)
  (:print
   ()
   (format t "result :: ~A/~A~%" numer denom))
  (:setNumer (n) (setq numer n))
  (:getNumer () numer)
  (:setDenom (d)(setq denom d))
  (:getDenom () denom)
  (:add-rat (r)
	    (setq result (instance rat :init
					  (+ (* numer (send r :getDenom)) (* denom (send r :getNumer)))
					  (* denom (send r :getDenom)))) result))
