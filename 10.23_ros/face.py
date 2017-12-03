#!/user/bin/env python

from opencv_apps.msg import FaceArrayStamped
import rospy

def callback(msg):
    rospy.loginfo("Found {} faces".format(len(msg.faces)))
    for face in msg.faces:
        rospy.loginfo('{} {} '.format(face.face.x,face.face.y))

rospy.init_node('face-clinet')
rospy.Subscriber('face_detection/cases',FaceArrayStamped,callback)
rospy.spin()
