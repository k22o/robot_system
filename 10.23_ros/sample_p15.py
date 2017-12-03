#!/usr/bin/env/python
#-*- coding: utf-8 -*-

import sys
sys.modules["pyassimp"] = sys
import pyassimp

from moveit_commander import MoveGroupCommander
from geometry_msgs.msg import Pose
import rospy

import atexit,os
atexit.register(lambda : os._exit(0))

group = MoveGroupCommander("manipulator")

rospy.init_node("vs60_example")

target_pose = Pose()
target_pose.position.x = -0.3
target_pose.position.y = -0.7
target_pose.orientation.w = 1

group.set_pose_target(target_pose)

group.go()

#'''
import tf
br = tf.TransformBroadcaster()
for i in range(2):
    br.sendTransform((target_pose.position.x,
                     target_pose.position.y,
                     target_pose.position.z),
                    (target_pose.orientation.x,target_pose.orientation.y,
                     target_pose.orientation.z,target_pose.orientation.w),
                     rospy.Time.now(),"target_pose","BASE")
    rospy.sleep(1)
'''
