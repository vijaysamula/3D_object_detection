
(cl:in-package :asdf)

(defsystem "deploy-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :jsk_recognition_msgs-msg
               :sensor_msgs-msg
)
  :components ((:file "_package")
    (:file "CheckFor3DObjects" :depends-on ("_package_CheckFor3DObjects"))
    (:file "_package_CheckFor3DObjects" :depends-on ("_package"))
  ))