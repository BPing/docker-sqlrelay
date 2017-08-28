# 基于centos
FROM centos
MAINTAINER cbping "452775680@qq.com"
# 编译环境安装
RUN yum -y install gcc-c++ make readline-devel openssl-devel krb5-devel pcre-devel libcurl-devel perl-devel php-devel php-pdo \
python-devel ruby-devel ruby-libs ruby tcl-devel java-1.7.0-openjdk-devel \
mariadb-devel postgresql-devel sqlite-devel unixODBC-devel

# 下载文件
RUN yum -y install wget && \
    cd /opt/ && \
	wget http://downloads.sourceforge.net/sqlrelay/sqlrelay-1.1.0.tar.gz &&  \
	wget http://downloads.sourceforge.net/rudiments/rudiments-1.0.5.tar.gz

# 解压
RUN tar -xvf /opt/rudiments-1.0.5.tar.gz &&\
    tar -xvf /opt/sqlrelay-1.1.0.tar.gz
	
# 编译安装
RUN cd /opt/rudiments-1.0.5 &&\
    ./configure --prefix=/opt/firstworks 
RUN make && make install

RUN cd opt/sqlrelay-1.1.0 && \ 
   ./configure -prefix=/opt/firstworks  -with-rudiments-prefix=/opt/firstworks
RUN make && make install

# 配置可执行文件目录
ENV PATH /opt/firstworks/bin:$PATH  

ENTRYPOINT [""]
