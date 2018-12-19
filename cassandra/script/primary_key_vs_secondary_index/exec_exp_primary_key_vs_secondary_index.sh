function recho { echo -e "\e[1;31m $* \e[m"; }
function drop_keyspace { cqlsh -e "DROP KEYSPACE IF EXISTS $*;"; recho "$* dropped."; }

ops_sum=20000000
title=primary_key_vs_secondary_index
now=`date +%Y%m%d_%H-%M-%S`
log_file_name="log_${now}.log"
file_name="bench_primary_vs_secondary_${now}.html"

{
drop_keyspace "bench" 
recho "primary index"
cassandra-stress user profile=./with_primary_index.yaml n=$ops_sum ops\(insert=9,get_by_userid=1\) cl=QUORUM -graph file=$file_name title=$title revision=primary_index

drop_keyspace "bench"
recho "secondary index"
cassandra-stress user profile=./with_2nd_index.yaml n=$ops_sum ops\(insert=9,get_by_userid_4_2ndary_index=1\) cl=QUORUM -graph file=$file_name title=$title revision=secondary_index
drop_keyspace "bench"
} > $log_file_name
