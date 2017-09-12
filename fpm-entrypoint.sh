#!/bin/bash -e

workplace='/workplace'
dockerWork="$workplace/dockerwork"
phpFpm66="$dockerWork/php-fpm6.6"
phpLocalPath="/etc/php"
phpIni="/php.ini"
fpmConf="/php-fpm.conf"
fpmConfD="/php-fpm.d"

if [ ! -d "$phpFpm66" ]; then
    mkdir -p "$phpFpm66"
fi

# Create php.ini file soft connections
if [ ! -f "$phpFpm66$phpIni" ];then
    cp "$phpLocalPath$phpIni" "$phpFpm66$phpIni"
fi
rm "$phpLocalPath$phpIni"
ln -s "$phpFpm66$phpIni" "$phpLocalPath$phpIni"

# Create php-fpm.conf file soft connections
if [ ! -f "$phpFpm66$fpmConf" ];then
    cp "$phpLocalPath$fpmConf" "$phpFpm66$fpmConf"
fi
rm "$phpLocalPath$fpmConf"
ln -s "$phpFpm66$fpmConf" "$phpLocalPath$fpmConf"

# Create php-fpm.d dir soft connections
if [ ! -d "$phpFpm66$fpmConfD" ];then
    cp -r "$phpLocalPath$fpmConfD" "$phpFpm66$fpmConfD"
fi
rm -r "$phpLocalPath$fpmConfD"
ln -s "$phpFpm66$fpmConfD" "$phpLocalPath$fpmConfD"


#startup
if [[ "$1" == "start" ]]; then
  # start sql-relay service
  echo "start php-fpm..."
  sevice php-fpm start
else
  # exec other command,for example a `bash` shell to explore this image
  exec "$@"
fi
