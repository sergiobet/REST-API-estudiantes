#!/usr/bin/env bash

echo "Instalando dependencias..."
composer install --no-dev --optimize-autoloader

echo "Generando clave de aplicación..."
php artisan key:generate

echo "Migrando base de datos..."
php artisan migrate --force

echo "Cacheando configuración..."
php artisan config:cache

echo "Iniciando servidor..."
php-fpm
