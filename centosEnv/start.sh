rm -rf /run/httpd/* /tmp/httpd*

if grep -w "DB_HOST=127.0.0.1" $LARAVEL_ENVIRONMENT_FILE; then
  sed -i -e "s/DB_HOST=127.0.0.1/DB_HOST=$DB_HOST/g" $LARAVEL_ENVIRONMENT_FILE
fi

if grep -w "DB_DATABASE=homestead" $LARAVEL_ENVIRONMENT_FILE; then
  sed -i -e "s/DB_DATABASE=homestead/DB_DATABASE=$DB_DATABASE/g" $LARAVEL_ENVIRONMENT_FILE
fi

if grep -w "DB_USERNAME=homestead" $LARAVEL_ENVIRONMENT_FILE; then
  sed -i -e "s/DB_USERNAME=homestead/DB_USERNAME=$DB_USERNAME/g" $LARAVEL_ENVIRONMENT_FILE
fi

if grep -w "DB_PASSWORD=secret" $LARAVEL_ENVIRONMENT_FILE; then
  sed -i -e "s/DB_PASSWORD=secret/DB_PASSWORD=$DB_PASSWORD/g" $LARAVEL_ENVIRONMENT_FILE
fi

if php /var/www/html/artisan migrate; then
  php /var/www/html/artisan make:auth
fi

exec /usr/sbin/apachectl -D FOREGROUND
