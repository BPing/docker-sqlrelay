# docker-sqlrelay
run sql-relay as docker container 

[sql-relay](http://sqlrelay.sourceforge.net/sqlrelay/)

## Building

To build the image, simply invoke

    docker build github.com/cbping/docker-sqlrelay

A prebuilt container is also available in the docker index

    docker pull cbping/sqlrelay

## [sql-relay conf](http://sqlrelay.sourceforge.net/sqlrelay/admin/configguide.html)

`example for mysql`

```conf
<?xml version="1.0"?>
<instances>

<instance id="cbping" dbase="mysql" port="9000" connections="5" maxconnections="10">
<users>
<user user="cbping" password="cbping"/>
</users>
<connections>
<connection  string="user=root;password=root;db=test;host=192.168.11.24;port=3306" />
</connections>
</instance>
</instances>
```
