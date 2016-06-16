FROM 1and1internet/ubuntu-16-apache:latest
MAINTAINER james.wilkins@fasthosts.co.uk
ARG DEBIAN_FRONTEND=noninteractive
RUN \
    apt-get update && \
    apt-get install -y python-software-properties software-properties-common && \
    LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php && \
    apt-get update && \
    apt-get install -y libapache2-mod-php5.6 php5.6-cli php5.6-common php5.6-curl php5.6-gd php5.6-mysql php5.6-sqlite php5.6-xml php5.6-zip php5.6-mbstring php5.6-gettext && \
    mkdir /tmp/composer/ && \
    cd /tmp/composer && \
    curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer && \
    chmod a+x /usr/local/bin/composer && \
    cd / && \
    rm -rf /tmp/composer && \
    apt-get remove -y python-software-properties software-properties-common && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/* && \
    chmod 777 -R /var/www
EXPOSE 8080
