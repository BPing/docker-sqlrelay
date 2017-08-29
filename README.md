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


Avoid using a bind mount from a folder on host into `/xx`, as this might result in file permission issue. 
If you really need to bind mount `sqlrelay` data volume, 
ensure that directory on host is accessible by the sqlrelay user in container (sqlrelay user - uid 1000)
or use `-u some_other_user` parameter with `docker run`.

## Building

To build the image, simply invoke

    docker build github.com/cbping/docker-sqlrelay

A prebuilt container is also available in the docker index

    docker pull cbping/sqlrelay

