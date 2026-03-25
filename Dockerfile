FROM php:8.4-cli

WORKDIR /app

COPY . .

RUN apt-get update && apt-get install -y unzip git \
    && curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer

RUN composer install --optimize-autoloader --no-interaction

CMD ["php", "-S", "0.0.0.0:8080", "-t", "public"]