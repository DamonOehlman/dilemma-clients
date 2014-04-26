(ns dilemma.sample
  (:require [zeromq.zmq :as zmq]))

(defn -main []
  (let [context (zmq/context)]
    (with-open [requester (doto (zmq/socket context :req)
                            (zmq/connect "tcp://localhost:1441"))]

      (zmq/send requester "hello")
      (let [string (zmq/receive requester)]
        (printf "Received reply %s\n" string)))))
