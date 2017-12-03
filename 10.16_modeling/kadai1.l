(setq c1 (make-gdome(make-gdome(make-icosahedron 70))))
(setq c2 (make-gdome(make-gdome(make-icosahedron 30))))
(setq c3 (make-gdome(make-gdome(make-icosahedron 10))))
(send c1 :set-color :red)
(send c2 :set-color :blue)
(send c3 :set-color :yellow)
(send c2 :locate #f(300 0 0))
(send c3 :locate #f(350 0 0))
(send c1 :assoc c2)
(send c2 :assoc c3)
(objects (list c1 c2 c3))
(do-until-key
 (send c1 :rotate (deg2rad 2) :z)
 (send c2 :rotate (deg2rad 1) :z)
 (send c3 :rotate(deg2rad 3) :z)
 (send *irtviewer* :draw-objects)
 (x::window-main-one))




