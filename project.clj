(defproject metabase-sparksql-deps "1.2.1.spark2"
  :description "Dependencies needed to use the Metabase SparKSQL driver."
  :url "https://github.com/metabase/sparksql-deps"
  :license {:name "Apache License 2.0"
            :url "https://raw.githubusercontent.com/metabase/sparksql-deps/master/LICENSE"}
  :dependencies [[org.apache.hadoop/hadoop-common "3.1.0"]
                 [org.clojure/clojure "1.8.0"]
                 [org.spark-project.hive/hive-jdbc "1.2.1.spark2"
                  :exclusions [org.apache.curator/curator-framework
                               org.apache.curator/curator-recipes
                               org.apache.thrift/libfb303
                               org.apache.zookeeper/zookeeper
                               org.eclipse.jetty.aggregate/jetty-all]]]
  :aot :all
  :uberjar-exclusions [#".*clojure.*"])
