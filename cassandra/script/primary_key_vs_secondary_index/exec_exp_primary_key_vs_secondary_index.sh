function recho { echo -e "\e[1;31m $* \e[m"; }
function drop_keyspace { cqlsh -e "DROP KEYSPACE IF EXISTS $*;"; recho "$* dropped."; }

ops_sum=50000
title=primary_key_vs_custom_secondary_index
now=`date +%Y%m%d_%H-%M-%S`
log_file_name="log_${now}.log"
file_name="bench_primary_vs_secondary_${now}.html"


#drop_keyspace "bench"
#recho "sparce secondary index"
#cassandra-stress user profile=./with_sparce_custom_index.yaml n=$ops_sum ops\(insert=9,get_by_userid_4_2ndary_index=1\) cl=QUORUM -graph file=$file_name title=$title revision=sparce_secondary_index

drop_keyspace "bench"
recho "prefix secondary index"
cassandra-stress user profile=./with_prefix_custom_index.yaml n=$ops_sum ops\(insert=9,get_by_userid_4_2ndary_index=1\) cl=QUORUM -graph file=$file_name title=$title revision=prefix_secondary_index


drop_keyspace "bench" 
recho "primary index"
cassandra-stress user profile=./with_primary_index.yaml n=$ops_sum ops\(insert=9,get_by_userid=1\) cl=QUORUM -graph file=$file_name title=$title revision=primary_index
