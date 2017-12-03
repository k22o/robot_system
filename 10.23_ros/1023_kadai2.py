#!/usr/bin/env python

import rospy,actionlib
from opencv_apps.msg import RotatedRectStamped
from image_view2.msg import ImageMarker2
from geometry_msgs.msg import Point
from move_base_msgs.msg import *
#from geometry_msgs.msg import Twist


def cb(msg):
    print msg.rect
    marker = ImageMarker2()
    marker.type =0
    marker.position = Point(msg.rect.center.x,msg.rect.center.y,0)
    pub.publish(marker)

    if msg.rect.center.x != 0 :
        try:
            #rospy.init_node('send_goal',anonymous=True)
            client = actionlib.SimpleActionClient('move_base',MoveBaseAction)
            client.wait_for_server()
            goal = MoveBaseGoal()
            goal.target_pose.header.stamp = rospy.Time.now()
            goal.target_pose.header.frame_id = "/map"
            goal.target_pose.pose.position.x = 3
            goal.target_pose.pose.position.y = 3
            goal.target_pose.pose.orientation.w = -1
            print goal
            client.send_goal(goal)
            print client.wait_for_result()

        except rospy.ROSInterruptException: pass



if __name__ == '__main__':

    rospy.init_node('client')
    #pub0 = rospy.Publisher('cmd_vel', Twist, queue_size=100)
    rospy.Subscriber('/camshift/track_box',RotatedRectStamped,cb)
    pub = rospy.Publisher('/image_marker', ImageMarker2)

    rospy.spin()
