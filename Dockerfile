FROM centos

MAINTAINER cbping "452775680@qq.com"

# Compile environment installation
RUN yum -y install gcc-c++ make readline-devel openssl-devel krb5-devel libcurl-devel  \
   #  pcre-devel perl-devel php-devel php-pdo \
   #  python-devel ruby-devel ruby-libs ruby tcl-devel java-1.7.0-openjdk-devel \
   #  mariadb-devel postgresql-devel sqlite-devel unixODBC-devel

# download sqlrelay
RUN yum -y install wget && \
    cd /opt/ && \
	wget http://downloads.sourceforge.net/sqlrelay/sqlrelay-1.1.0.tar.gz &&  \
	wget http://downloads.sourceforge.net/rudiments/rudiments-1.0.5.tar.gz

# tar
RUN cd /opt/  &&\
    tar -xvf  rudiments-1.0.5.tar.gz &&\
    tar -xvf  sqlrelay-1.1.0.tar.gz

# build and install sqlrelay
RUN cd /opt/rudiments-1.0.5 &&\
    ./configure --prefix=/opt/firstworks &&\
    make && make install

RUN cd /opt/sqlrelay-1.1.0 && \ 
    ./configure --prefix=/opt/firstworks  --with-rudiments-prefix=/opt/firstworks \
    --disable-oracle --disable-postgresql --disable-sap --disable-odbc --disable-db2  --disable-firebird \
    --disable-informix --disable-router --disable-odbc-driver --disable-perl --disable-python --disable-ruby \
    --disable-java --disable-tcl  --disable-php --disable-nodejs --disable-cs  &&\
    make && make install

# Delete residual useless files and installed
RUN rm -f /opt/rudiments-1.0.5.tar.gz && \
    rm -f /opt/sqlrelay-1.1.0.tar.gz  && \
    rm -rf /opt/rudiments-1.0.5       && \
    rm -rf /opt/sqlrelay-1.1.0        && \
    yum -y remove wget krb5-devel*  libcurl-devel*


ENV PATH /opt/firstworks/bin:$PATH

COPY sqlr-entrypoint.sh /opt/bin/sqlr-entrypoint.sh
ENV PATH /opt/bin:$PATH
ENTRYPOINT ["sqlr-entrypoint.sh"]

