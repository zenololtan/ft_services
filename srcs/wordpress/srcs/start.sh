php-fpm7

while :
do
    mysqladmin -h mysql ping
    if [ $? == 0 ]
    then
        break
    fi
	echo
    sleep 10
done
echo "Connection with Mysql established."

su -c "/wpinstall.sh" - www
nginx

while true; do
	sleep 10s
	ps | grep nginx | grep master
	if [ $? == 1 ]; then break
	fi
	ps | grep php-fpm | grep master
	if [ $? == 1 ]; then break
	fi
done