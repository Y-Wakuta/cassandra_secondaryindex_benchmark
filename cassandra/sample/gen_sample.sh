#!/bin/bash

set -e

cd `dirname $0`

record_num=$1
str_len=20 #first name,last nameの文字列の長さを決定する。
file_name=$2

echo "" > $file_name

echo "making sample"
for i in $(seq 1 ${record_num}) ; do
    first_name=`printf %0${str_len}d $i`
    last_name=`cat /dev/urandom | tr -dc 'a-zA-Z' | fold -w 15 | head -n 1`
    echo "INSERT INTO bench.users_id_index (userid,first_name,last_name) VALUES('${i}','${first_name}','${last_name}');" >> $file_name
    echo "INSERT INTO bench.users_first_name_index (userid,first_name,last_name) VALUES('${i}','${first_name}','${last_name}');" >> $file_name
done
    
