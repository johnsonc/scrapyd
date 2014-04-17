FROM ubuntu:12.04
MAINTAINER Matthias Kadenbach <matthias.kadenbach@gmail.com>

RUN echo 'deb http://archive.scrapy.org/ubuntu scrapy main' | tee /etc/apt/sources.list.d/scrapy.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 627220E7

RUN apt-get update
# RUN apt-get upgrade -y

RUN apt-get install wget curl git -y

RUN apt-get install scrapy-0.22 scrapyd -y

# add boto
RUN mkdir -p /usr/local/opt && cd /usr/local/opt && git clone https://github.com/boto/boto.git boto && cd boto && git checkout tags/2.27.0 && python setup.py install


# add nginx to have authentication for scrapyd
# see https://github.com/scrapy/scrapyd/issues/43
RUN apt-get install nginx apache2-utils -y
RUN htpasswd -b -c /etc/nginx/.htpasswd admin scrapyd # log into machine and change this password!
ADD nginx.conf  /etc/nginx/nginx.conf

EXPOSE 6801

ADD start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh
CMD /usr/local/bin/start.sh

