FROM mobingi/ubuntu-apache2-php7:7.0

MAINTAINER "Lmaky <lmaky88@gmail.com">

RUN apt-get update \
  && apt-get install -y curl \
  && apt-get install -y wget \
  && rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/vrana/adminer/releases/download/v4.6.3/adminer-4.6.3-mysql.php \
  && mkdir -p /var/www/html/adminer \
  && mv adminer-4.6.3-mysql.php /var/www/html/adminer/index.php

RUN sed -i -e 's/upload_max_filesize = 2M/upload_max_filesize = 20M/g' /etc/php/7.0/apache2/php.ini
RUN sed -i -e 's/post_max_size = 8M/post_max_size = 20M/g' /etc/php/7.0/apache2/php.ini
