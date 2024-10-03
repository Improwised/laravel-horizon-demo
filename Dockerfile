FROM improwised/php-base:8.2-s6
RUN mkdir -p /app && chown -R nginx:nginx /app

COPY composer.* /app/

WORKDIR /app
RUN php -d memory_limit=1024M /usr/bin/composer install --no-scripts --no-autoloader

COPY . /app/

RUN php -d memory_limit=1024M /usr/bin/composer dump-autoload --optimize

WORKDIR /app
