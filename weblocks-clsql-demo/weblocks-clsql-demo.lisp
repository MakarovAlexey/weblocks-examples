
(defpackage #:weblocks-clsql-demo
  (:use :cl :weblocks :metatilities)
  (:import-from :weblocks-stores :*default-store* :find-persistent-objects)
  (:documentation
   "A web application based on Weblocks."))

(in-package :weblocks-clsql-demo)

(export '(start-weblocks-clsql-demo stop-weblocks-clsql-demo))

;; Define our application
(defwebapp weblocks-clsql-demo
    :description "A web application based on Weblocks using clsql"
    :autostart nil
    :prefix "/"
    :init-user-session  'init-user-session
    :dependencies
    '((:stylesheet "suggest")))

(defun start-weblocks-clsql-demo (&rest args)
  "Starts the application by calling 'start-weblocks' with appropriate
arguments."
  (let ((app-args (when (getf args :prefix) 
                     (prog1 
                       (list :prefix (getf args :prefix)) 
                       (remf args :prefix)))))
    (apply #'start-weblocks args)
    (apply #'start-webapp (list* 'weblocks-clsql-demo app-args))))

(defun stop-weblocks-clsql-demo ()
  "Stops the application by calling 'stop-weblocks'."
  (stop-weblocks))

