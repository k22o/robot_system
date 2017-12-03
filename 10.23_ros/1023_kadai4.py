#!/user/bin/env python


import rospy,actionlib,roslib
from move_base_msgs.msg import *

if __name__ == '__main__':

    try:
        rospy.init_node('send_goal',anonymous=True)
        client = actionlib.SimpleActionClient('move_base',MoveBaseAction)
        client.wait_for_server()

        goal = MoveBaseGoal()
        goal.target_pose.header.stamp = rospy.Time.now()
        goal.target_pose.header.frame_id = "/map"
        goal.target_pose.pose.position.x = 32
        goal.target_pose.pose.position.y = 34
        goal.target_pose.pose.orientation.w = 1
        print goal
        client.send_goal(goal)

        if (client.wait_for_result(rospy.Duration.from_sec(5.0))==False):
                    print "False"
                    client.cancel_goal()
        else:
            print "True"
    except rospy.ROSInterruptException: pass
