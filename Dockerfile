FROM centos:7

RUN yum update -y

# repository
RUN yum install -y \
			epel-release \
			https://centos7.iuscommunity.org/ius-release.rpm \

# tools
RUN yum install -y \
			libfontconfig.so.1 \
			fontconfig \
			openssl \
			bzip2 \
			wget \
			unzip

# python
RUN yum install -y \
			python36u \
			python36u-libs \
			python36u-devel \
			python36u-pip

RUN pip3.6 install \
			selenium==3.8.1 \
			slackbot \
			slacker \
			mysql-connector-python

# nodejs
RUN yum install -y \
			npm \
			nodejs \

RUN npm install -y --prefix=/home/work/modules/ \
			phantomjs

#install japanese environment for phantomjs
RUN wget -S -O "NotoSansCJKjp-hinted.zip" "https://noto-website-2.storage.googleapis.com/pkgs/NotoSansCJKjp-hinted.zip"
RUN mkdir /usr/share/fonts/noto
RUN unzip NotoSansCJKjp-hinted.zip
RUN cp -p *.otf /usr/share/fonts/noto/
RUN chmod 644 /usr/share/fonts/noto/*.otf
RUN chown root:root /usr/share/fonts/noto/*.otf

# make work directories
RUN mkdir /home/work/
RUN mkdir /var/lib/mysql

# vi-like shell input
RUN echo 'set -o vi' > /etc/profile.d/keybindings.sh
