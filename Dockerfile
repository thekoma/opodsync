# Use php:apache as the base image
FROM php:apache

# Install system dependencies for PHP extensions
RUN apt-get update && apt-get install -y \
    libsqlite3-dev \
    && rm -rf /var/lib/apt/lists/*

# Install sqlite3 and pdo_sqlite PHP extensions
RUN docker-php-ext-install pdo_sqlite sqlite3

# Set the working directory
WORKDIR /var/www/html

# Copy the server directory contents into the image's document root
COPY server/ /var/www/html/

# Create a data subdirectory inside the application directory
RUN mkdir -p /var/www/html/data && chown www-data:www-data /var/www/html/data && chmod 755 /var/www/html/data

# Expose port 80
EXPOSE 80

# The default CMD from php:apache (apache2-foreground) will be used
