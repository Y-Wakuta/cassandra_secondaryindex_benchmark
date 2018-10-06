sleep 15

echo -e  "\e[1;31m start \e[m"
cqlsh -f /opt/cassandra/schema/create_keyspace.cql
echo -e  "\e[1;31m create keyspace attempted \e[m"
cqlsh -f /opt/cassandra/schema/create_tables.cql
echo -e  "\e[1;31m create tables attempted \e[m"
bash /opt/cassandra/sample/gen_sample.sh 1000 insert_sample.cql
echo -e  "\e[1;31m insert samples \e[m"

cqlsh -f /opt/cassandra/sample/insert_sample.cql
