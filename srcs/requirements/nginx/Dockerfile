# nginx Dockerfile

FROM debian:bullseye

# Combine commands in order to reduce layers in the Docker image
RUN apt update && apt upgrade -y && apt install -y nginx openssl

# Below is default config file of nginx with FastCGI enabled and index.php served
COPY default /etc/nginx/sites-available/

# Run nginx in foreground process mode instead of deamon
# so that the container execution won't end and exit
CMD ["nginx", "-g", "daemon off;"]

