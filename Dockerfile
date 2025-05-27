# Use php:apache as the base image
FROM php:apache

# Install sqlite3 and pdo_sqlite PHP extensions
RUN docker-php-ext-install pdo_sqlite sqlite3

# Set the working directory
WORKDIR /var/www/html

# Copy the server directory into the image's document root
COPY server/ /var/www/html/

# Create a data subdirectory
RUN mkdir /var/www/html/data

# Set permissions for the data directory
RUN chown www-data:www-data /var/www/html/data
RUN chmod 755 /var/www/html/data

# Expose port 80
EXPOSE 80
