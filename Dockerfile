FROM php:7.4-apache
WORKDIR /var/www/html
# update packages
RUN apt-get update
# install zip and pdo extensions
RUN apt-get install -y \
        libzip-dev \
        zip \
    && docker-php-ext-configure zip \
    && docker-php-ext-install zip \
    && docker-php-ext-install pdo pdo_mysql

# install gd image library
RUN apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
  && docker-php-ext-install -j "$(nproc)" gd

# install intl extension
RUN apt-get install -y zlib1g-dev libicu-dev g++ \
&& docker-php-ext-configure intl \
&& docker-php-ext-install intl

# enable mod_rewrite
RUN a2enmod rewrite

# install opcache for php acceleration
RUN docker-php-ext-install opcache \
    && docker-php-ext-enable opcache \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get autoremove -y

# copy prestashop folder content
COPY ./ /var/www/html
# Change owner and permissions
# RUN chown -R www-data:www-data /var/www/html/var/logs
RUN chmod -R 0777 /var/www/html/config \
/var/www/html/img \
/var/www/html/mails \
/var/www/html/modules \
/var/www/html/translations \
/var/www/html/upload \
/var/www/html/download \
/var/www/html/app/config \
/var/www/html/app/Resources/translations \
/var/www/html/img

RUN touch /usr/local/etc/php/php.ini && echo "short_open_tag=FALSE" >> /usr/local/etc/php/php.ini

EXPOSE 80