# wordpress Dockerfile

FROM debian:bullseye

RUN apt update && apt upgrade -y && apt install -y php-fpm

# Run PHP FastCGI Process Manager
# -F forces to run in the background
CMD ["php-fpm7.4", "-F"]

