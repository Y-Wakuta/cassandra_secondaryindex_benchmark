#FROM spotify/cassandra:latest
FROM cassandra:latest

#cassandra-cliは実行後に「cassandra-cli」と入力するだけで使える。実行時にホスト上のスクリプトのスキーマを流し込むくらいの事はしても良いかも。

#RUN rm /etc/cassandra/cassandra.yaml
#ADD ./cassandra.yaml /etc/cassandra/

#RUN echo "batch_size_fail_threshold_in_kb: 9192" >> /etc/cassandra/cassandra.yaml
#RUN sed -i -e "s/system_memory_in_mb=\"2048\"/system_memory_in_mb=\"40960\"/g" /etc/cassandra/cassandra-env.sh
#RUN sed -i -e "s/system_cpu_cores/system_memory_in_mb=\"40960\"/g" /etc/cassandra/cassandra-env.sh

RUN apt-get update
RUN apt-get install -y vim

RUN mkdir -p /opt/cassandra/schema
RUN mkdir -p /opt/cassandra/sample

WORKDIR /home/tools

