# Usa una imagen oficial con PHP y Composer
FROM php:8.2-fpm

# Instala dependencias necesarias
RUN apt-get update && apt-get install -y \
    git zip unzip curl libpng-dev libonig-dev libxml2-dev libzip-dev \
    && docker-php-ext-install pdo_mysql mbstring zip exif pcntl

# Instala Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Copia el código fuente
WORKDIR /var/www/html
COPY . .

# Permisos
RUN chown -R www-data:www-data /var/www/html

# Expone el puerto
EXPOSE 8000

# Comando por defecto (puedes usar start.sh si lo prefieres)
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8000"]
