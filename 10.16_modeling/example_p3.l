(make-irtviewer)
(setq pa (make-cascoords :pos #f(0 400 1600)));arm
(setq ph (make-cascoords :pos #f(0 400 1000)));hand
(send pa :assoc ph)
(objects (list pa ph *world-coords*))
(send pa :rotate(deg2rad 45) :x)
(send *irtviewer* :draw-objects)

(do ((i 0 (+ i 1)))
    ((> i 90))
    (send pa :orient (deg2rad i) :x :world)
    (send *irtviewer* :draw-objects))
