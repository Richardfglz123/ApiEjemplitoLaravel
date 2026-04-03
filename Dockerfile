FROM php:8.4-cli

WORKDIR /app

COPY . .

# 1. Instalamos las herramientas del sistema y la extensión de MySQL
RUN apt-get update && apt-get install -y unzip git libzip-dev \
    && docker-php-ext-install pdo_mysql \
    && curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer

# 2. Instalamos dependencias de Composer
RUN composer install --optimize-autoloader --no-interaction

# 3. Arrancamos el servidor
CMD ["php", "-S", "0.0.0.0:8080", "-t", "public"]