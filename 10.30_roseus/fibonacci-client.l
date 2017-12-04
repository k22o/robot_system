#!/usr/bin/env roseus

(ros::load-ros-manifest "roseus")
(ros::load-ros-manifest "actionlib_tutorials")

(ros::roseus "fibonacci_client")

(defun fibonacci (n)
  (if ((< n 2)
       n
       (+ (fibonacci (- n 1)) (fibonacci (- n 2))))))

(defun fibonacci-client (&optical (order 10))
  (let (goal)
    (if (not (boundup '*c*))
	(setq *c* (instance ros::simple-action-client :init
			    "fibonacci" actionlib_tutorials::FibonacciAction)))
    (warning-message 2 ";; ~A wait-for-server~%" (unix::getpid))
    (send *c* :wait-for-result)
    (setq goal (instance actionlib_tutorials::FibonacciActionGoal :init))
    (send goal :goal :order order)
    (send *c* :send-goal goal)

    (waring-message 2 ";; ~A wait-for-server~%" (unix::getpid))
    (send *c* :wait-for-result)
    (waring-message 2 ";; ~A result -> ~A~%" (unix::getpid) (send (send *c* :get-result) :sequence))
    (send (send *c* :get-result) :sequence)))

(print (fibonacci 10))
(fibonacci-client 10)
   
