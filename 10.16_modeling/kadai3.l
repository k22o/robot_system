(defun small-box nil
  (let (b1 b2)
    (setq b1 (make-cube 15 20 10))
    (setq b2 (make-cube 13 18 7))
    (send b2 :locate #f(0 0 1.5))
    (setq b1 (body- b1 b2))
    (send b1 :set-color :glay)
    b1))

(defun large-box nil
  (let (b1 b2 b3 b4 b5)
    (setq b1 (make-cube 20 55 35))
    (setq b2 (make-cube 15 20 10))
    (send b2 :locate #f(2.5 -12.5 7.5))
    (setq b3 (make-cube 15 20 10))
    (send b3 :locate #f(2.5 -12.5 -7.5))
    (setq b4 (make-cube 15 20 10))
    (send b4 :locate #f(2.5 12.5 7.5))
    (setq b5 (make-cube 15 20 10))
    (send b5 :locate #f(2.5 12.5 -7.5))
    (setq b1 (body- b1 b2 b3 b4 b5))
    ;(setq b1 (body- b1 b3))
    ;(setq b1 (body- b1 b4))
    ;(setq b1 (body- b1 b5))
    (send b1 :set-color :white)
    b1))

(defclass boxcase
  :super cascaded-link)
(defmethod boxcase
  (:init ()
    (let (b1 s1 s2 s3 s4 s5 l0 l1 l2 l3 l4)
      (send-super :init)
      (setq b1 (large-box))
      (setq l0 (instance bodyset-link :init (make-cascoords) :bodies (list b1)))

      (setq s1 (small-box))
      (setq l1 (instance bodyset-link :init (make-cascoords) :bodies (list s1)))
      (send l1 :locate #f(2.5 -12.5 7.5))
      (send l0 :assoc l1)

      (setq s2 (small-box))
      (setq l2 (instance bodyset-link :init (make-cascoords) :bodies (list s2)))
      (send l2 :locate #f(2.5 -12.5 -7.5))
      (send l0 :assoc l2)

      (setq s3 (small-box))
      (setq l3 (instance bodyset-link :init (make-cascoords) :bodies (list s3)))
      (send l3 :locate #f(2.5 12.5 7.5))
      (send l0 :assoc l3)

      (setq s4 (small-box))
      (setq l4 (instance bodyset-link :init (make-cascoords) :bodies (list s4)))
      (send l4 :locate #f(2.5 12.5 -7.5))
      (send l0 :assoc l4)

      (send self :assoc l0)

      (setq joint-list
        (list (instance linear-joint :init :parent-link l0 :child-link l1 :axis :x)
              (instance linear-joint :init :parent-link l0 :child-link l2 :axis :x)
              (instance linear-joint :init :parent-link l0 :child-link l3 :axis :x)
              (instance linear-joint :init :parent-link l0 :child-link l4 :axis :x)))
      (setq links (list l0 l1 l2 l3 l4))
      (send self :init-ending)
      )
      self))

(setq r (instance boxcase :init))
(objects (list r))
(send *irtviewer* :draw-objects)

;(dotimes(i 100)
;  (if (< (mod i 20) 20)
;    (send r :angle-vector (float-vector (+ (mod i 20) 5 )
;                                          (+ (mod i 20) 5 )
;                                          (+ (mod i 20) 5 )
;                                          (+ (mod i 20) 5 )))
;    (send r :angle-vector (float-vector (- (mod i 20) 25 )
;                                          (- (mod i 20) 25 )
;                                          (- (mod i 20) 25 )
;                                          (- (mod i 20) 25 ))))

;    (send *irtviewer* :draw-objects))
