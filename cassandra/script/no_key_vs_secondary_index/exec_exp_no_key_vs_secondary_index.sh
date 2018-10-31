function recho { echo -e "\e[1;31m $* \e[m"; }
function drop_keyspace { cqlsh -e "DROP KEYSPACE IF EXISTS $*;"; recho "$* dropped."; }

ops_sum=1000000
file_name=./bench_graph.html


drop_keyspace "bench"
recho "no index"
cassandra-stress user profile=./no_2nd_index.yaml n=$ops_sum ops\(insert=3,get_by_first_name=1\) cl=QUORUM -graph file=$file_name title=bench revision=no_index

drop_keyspace "bench"
recho "with index"
cassandra-stress user profile=./with_2nd_index.yaml n=$ops_sum ops\(insert=3,get_by_first_name=1\) cl=QUORUM -graph file=$file_name title=bench revision=with_index
drop_keyspace "bench"
