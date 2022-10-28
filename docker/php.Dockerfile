FROM php:7.4-fpm as docker-build-admin
SHELL ["/bin/bash", "-c"]
WORKDIR /var/www

# nodejs
RUN curl https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash && \
    source ~/.bashrc && nvm install --lts && \
    npm i -g yarn pnpm && \
    ln -s `which node` /usr/bin/node && \
    ln -s `which npm` /usr/bin/npm && \
    ln -s `which yarn` /usr/bin/yarn && \
    ln -s `which pnpm` /usr/bin/pnpm

# composer
RUN curl https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

# php extension
RUN apt update && apt install -y libpng-dev libjpeg-dev libfreetype6-dev zip unzip
RUN docker-php-ext-configure gd --with-freetype && \
    docker-php-ext-install mysqli bcmath gd pdo pdo_mysql

EXPOSE 9000 9001 1818 8000