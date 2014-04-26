(defproject dilemma-example "0.0.0-SNAPSHOT"
  :description "Simple dilemma example"
  :jvm-opts ["-Djava.library.path=/usr/lib:/usr/local/lib"]
  :dependencies [[org.clojure/clojure "1.6.0"]
                 [org.zeromq/cljzmq "0.1.5-SNAPSHOT"]]
  :main dilemma.sample)
