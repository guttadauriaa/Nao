FROM ubuntu:18.04
ENV DEBIAN_FRONTEND noninteractive

# Server installation
RUN apt update \
  && apt upgrade -y \
  && apt install -y sudo htop curl ufw \
  && apt install -y python2.7 python-pip \
  && apt install -y apache2 mysql-server libapache2-mod-php php-mysql php-mbstring php-gettext phpmyadmin 
  
# Firewall configuration  
RUN sudo ufw allow ssh \
  && sudo ufw allow 80 \
  && sudo ufw allow 443 \
  && sudo ufw enable
