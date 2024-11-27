# Gebruik een basis PHP image met Apache
FROM php:8.1-apache

# Installeer vereiste PHP-extensies
RUN docker-php-ext-install pdo pdo_mysql mysqli

# Stel de werkdirectory in
WORKDIR /var/www/html

# Kopieer CodeIgniter bestanden naar de container
COPY . /var/www/html

# Installeer Composer voor dependency management
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Stel de juiste permissies in
RUN chown -R www-data:www-data /var/www/html && \
    chmod -R 755 /var/www/html

# Stel Apache opnieuw in om .htaccess bestanden te gebruiken
RUN a2enmod rewrite
