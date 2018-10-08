function recho { echo -e "\e[1;31m $* \e[m"; }

ops_sum=10000
file_name=./bench_graph.html

cqlsh -e "DROP KEYSPACE IF EXISTS bench;"

recho "no index"
cassandra-stress user profile=./no_2nd_index.yaml n=$ops_sum ops\(insert=1,get_by_first_name=1\)  no-warmup cl=QUORUM -graph file=$file_name title=bench revision=no_index

cqlsh -e "DROP KEYSPACE IF EXISTS bench;"
recho "with index"
cassandra-stress user profile=./with_2nd_index.yaml n=$ops_sum ops\(insert=1,get_by_first_name=1\)  no-warmup cl=QUORUM -graph file=$file_name title=bench revision=with_index

cqlsh -e "DROP KEYSPACE IF EXISTS bench;"
