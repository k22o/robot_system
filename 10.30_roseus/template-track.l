#!/usr/bin/env roseus

(ros::load-ros-manifest "image_view2")
;;;
;;;
(ros::roseus "template_tracking_marker")
(if (string= (ros::get-namespace) "/")
    (ros::ros-warn ";; Started in the global namespace! This is probably wrong.~%Start template-track.l in the camera namespace.~%Example command-line usage: $ ROS_NAMESPACE=my_camera ./template-track.l"))

;; this argument msg reperesents 2d-pose
;;　コールバック関数
(defun tracking-cb (trans-msg)
  (let ((mrk (instance image_view2::ImageMarker2 :init));インスタンスを生成してimage_view2のImageMarker2をmrkとした。
	(pt (instance geometry_msgs::Point :init)));インスタンスを生成してgeometory_msgsのPointをptとした。
    (send pt :x (send trans-msg :transform :translation :x));pt(Point)のx座標の設定
    (send pt :y (send trans-msg :transform :translation :y));pt(Point)のy座標の設定

    (send mrk :ns (send trans-msg :child_frame_id));namespaceの設定
    (send mrk :type image_view2::ImageMarker2::*CIRCLE*);typeの設定(今回はcircle)
    (send mrk :action image_view2::ImageMarker2::*ADD*);actionの設定(add or remove)
    (send mrk :position pt);位置の取得(上述のpt)
    (send mrk :scale 20);(今回は)円の半径

    (ros::publish "image_marker" mrk);publish a topic
    ))

(ros::advertise "image_marker" image_view2::ImageMarker2 1);Advertise a topic
(ros::subscribe "result" geometry_msgs::TransformStamped #'tracking-cb);Subscribe to a topic

(ros::rate 10)
(while (ros::ok);trueのとき
  (ros::spin-once);1;まわす
  (ros::sleep);やすむ
  )
