#!/usr/bin/env roseus

(ros::load-ros-manifest "roseus")
(ros::roseus "listener" :anonymous t)

(defun string-cb (msg) (print (list 'cb (send msg :data))))

(ros::subscribe "chatter" std_msgs::string #'string-cb)

(ros::rate 100)
(do-until-key
 (ros::sleep)
 (ros::spin-once))
(exit)
