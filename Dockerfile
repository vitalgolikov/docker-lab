FROM ubuntu:18.04

LABEL maintainer="vitaliy.golikov@digma.ua"

LABEL version="1.0"

LABEL description="Apache on port 8080"

RUN apt update && apt install -y apache2

RUN useradd -ms /bin/bash hillel_devops

COPY index.html /var/www/html/

COPY ports.conf /etc/apache2/

COPY apache2.conf /etc/apache2/

EXPOSE      8080

WORKDIR /var/www/html

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]

