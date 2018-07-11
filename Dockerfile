FROM ubuntu:18.04
ENV DEBIAN_FRONTEND noninteractive

# Server installation
RUN apt update \
  && apt install -y apache2 mysql-server libapache2-mod-php php-mysql
  
# Firewall configuration  
RUN ufw allow in "Apache Full"

