FROM centos:7

RUN yum update -y

# make work directories
RUN mkdir -p /home/work/app

# repository
RUN yum install -y \
			epel-release \
			https://centos7.iuscommunity.org/ius-release.rpm

# tools
RUN yum install -y \
			libfontconfig.so.1 \
			fontconfig \
			openssl \
			bzip2 \
			wget \
			unzip \
			mysql
