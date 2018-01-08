FROM centos:7

RUN mkdir /home/work/
RUN yum update -y
RUN yum install -y	libfontconfig.so.1 \
					fontconfig \
					openssl \
					epel-release \
					bzip2 \
					https://centos7.iuscommunity.org/ius-release.rpm \
					wget \
					unzip

RUN yum install -y	npm \
					nodejs \
					python36u \
					python36u-libs \
					python36u-devel \
					python36u-pip

RUN npm install -y --prefix=/home/work/modules/ phantomjs
RUN pip3.6 install selenium==3.8.1 slackbot slacker

#install japanese
RUN wget -S -O "NotoSansCJKjp-hinted.zip" "https://noto-website-2.storage.googleapis.com/pkgs/NotoSansCJKjp-hinted.zip"
RUN mkdir /usr/share/fonts/noto
RUN unzip NotoSansCJKjp-hinted.zip
RUN cp -p *.otf /usr/share/fonts/noto/
RUN chmod 644 /usr/share/fonts/noto/*.otf
RUN chown root:root /usr/share/fonts/noto/*.otf

# Vi ライクな操作
RUN echo 'set -o vi' > /etc/profile.d/keybindings.sh
