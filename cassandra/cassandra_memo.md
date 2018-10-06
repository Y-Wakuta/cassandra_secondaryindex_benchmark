poklet/cassandra:latestはベースになっているlinuxが最小構成版でapt等も使えなかったので、spotifyのcassandraイメージを使用

### dockerを直に使う時のコマンド

docker run -it --rm --net container:cassone poklet/cassandra cqlsh

### 参考

* cassandraのdocker imageを起動した後の使い方-> https://qiita.com/masato/items/f0d924ef2854970a9391
* リンク集 http://blog.takuros.net/entry/20100513/1273761340
* cassandra-cliのチュートリアル http://d.hatena.ne.jp/Kazuhira/20130420/1366441744