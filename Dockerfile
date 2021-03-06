FROM ubuntu:18.04
ENV DEBIAN_FRONTEND noninteractive

# Server installation
ADD pynaoqi-python2.7-2.1.4.13-linux64.tar.gz pynaoqi-python2.7-2.1.4.13-linux64.tar.gz
RUN apt update \
  && apt upgrade -y \
  && apt install -y sudo htop curl ufw software-properties-common \
  && add-apt-repository ppa:certbot/certbot \
  && apt update \
  && apt install -y python2.7 python-pip python-certbot-apache \
  && apt install -y apache2 mysql-server libapache2-mod-php php-mysql php-mbstring php-json php-gettext 
  

RUN find /var/lib/mysql -type f -exec touch {} \; \
  && /etc/init.d/mysql start \
  && apt install -y phpmyadmin 
  
# Firewall configuration  
#RUN sudo ufw allow ssh \
#  && sudo ufw allow 80 \
#  && sudo ufw allow 443 \
#  && sudo ufw enable
