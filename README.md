# docker-sqlrelay
run sql-relay as docker container 

[sql-relay](http://sqlrelay.sourceforge.net/sqlrelay/)

[sql-relay configure](http://sqlrelay.sourceforge.net/sqlrelay/admin/configguide.html)

[configure example for mysql](https://github.com/BPing/docker-sqlrelay/blob/master/sqlrelay.conf)

## Usage
To run the container, do the following(for example):

`docker run -p 9000:9000 -t -i -d cbping/sqlrelay https://raw.githubusercontent.com/BPing/docker-sqlrelay/master/sqlrelay.conf `

or use data volume

`docker run -p xx:xx -v /xx:/xx -t -i -d cbping/sqlrelay /xx/sqlrelay.conf`


## Building

To build the image, simply invoke

    docker build github.com/cbping/docker-sqlrelay

A prebuilt container is also available in the docker index

    docker pull cbping/sqlrelay

