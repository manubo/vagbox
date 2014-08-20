FROM ubuntu:14.04

MAINTAINER Manuel Bouza <mbouzarod@gmail.com>

# update package repository
RUN apt-get update

# install python3
RUN apt-get install -y python3
RUN apt-get install -y python3-pip
RUN pip3 install uwsgi
RUN pip3 install Django
RUN export PYTHONPATH=/usr/local/lib/python3.4/dist-packages:/usr/lib/python3/dist-packages

EXPOSE 9090

VOLUME ["/srv/www"]

ENTRYPOINT ["/usr/local/bin/uwsgi", "--http", ":9090", "--master", "--processes", "1", "--threads", "3","--wsgi-file"]

CMD []
