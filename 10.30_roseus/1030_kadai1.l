#!/usr/bin/env roseus

(ros::load-ros-manifest "roseus")
(ros::load-ros-manifest "actionlib")
(ros::load-ros-manifest "move_base_msgs")

(ros::roseus "send-goal")
(setq *c* (instance ros::simple-action-client :init
		    "move_base" move_base_msgs::MoveBaseAction))

(send *c* :wait-for-server)

(setq goal (instance move_base_msgs::MoveBaseActionGoal :init))
(send goal :goal :target_pose :header :stamp (ros::time-now))
(send goal :goal :target_pose :pose :position :x 3)
(send goal :goal :target_pose :pose :position :y -3)
(send goal :goal :target_pose :pose :orientation :w 1)

(describe goal)
(send *c* :send-goal goal)
(send *c* :wait-for-result)
(print "fin~%")
