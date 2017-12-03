(defun make-rod nil
  (let (b1)
        (setq b1 (make-cylinder 20 200))
        (send b1 :locate #f(0 0 -100))
        (send b1 :set-color :gray20)
        b1))

(defun make-linear-joint nil
  (let (b2 b3)
    (setq b2 (make-cylinder 20 20))
    (setq b3 (make-cylinder 30 20))
    (setq b3 (body- b3 b2))
    (send b3 :set-color :gray80)
    b3))


(defclass actuator
  :super cascaded-link
  :slots (r1 l1 j1))
(defmethod actuator
  (:init ()
   (let ()
      (send-super :init)
      (setq r1 (instance bodyset-link :init (make-cascoords) :bodies (list (make-rod))))
      (setq l1 (instance bodyset-link :init (make-cascoords) :bodies (list (make-linear-joint))))
      (setq j1 (instance linear-joint :init :parent-link r1  :child-link l1 :axis :z))
      (setq links (list r1 l1))
      (setq joint-list (list j1))
      (send self :assoc r1)
      (send r1 :assoc l1)
      (send self :init-ending)
      self))
      (send r :j1 :joint-angle 0)
      (:j1 (&rest args) (forward-message-to j1 args)))


(setq r (instance actuator :init))
(objects (list r))

(setq i 0)
(do-until-key
  (send r :angle-vector (float-vector(* 90 (sin (/ i 100.0)))))
  (send *irtviewer* :draw-objects)
  (incf i))
