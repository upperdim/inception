# wordpress Dockerfile

FROM debian:bullseye

RUN apt update && apt upgrade -y && apt install -y php-fpm

# Below is a default php-fpm config file with FastCGI listening address
# changed to 127.0.0.1:9000 instead of /run/php/php7.4-fpm.sock
COPY www.conf /etc/php/7.4/fpm/pool.d

# Create the directory expected by php-fpm, otherwise we get PID error
RUN mkdir -p /run/php

# Run PHP FastCGI Process Manager
# -F forces to run in the background
CMD ["php-fpm7.4", "-F"]

