FROM debian:latest

MAINTAINER Moeyard TRAN "moeyard@moeyard.com"

RUN apt-get update && \
	apt-get install -y wget && \
	wget http://soft.vpser.net/lnmp/lnmp1.5.tar.gz -cO lnmp1.5.tar.gz && \
  tar zxf lnmp1.5.tar.gz && \
  cd lnmp1.5 && \
  LNMP_Auto="y" DBSelect="2" DB_Root_Password="lnmp.org" InstallInnodb="y" PHPSelect="5" SelectMalloc="1" ./install.sh lnmp && \
	apt-get clean

RUN echo 'root:root' |chpasswd

EXPOSE 22
EXPOSE 80
EXPOSE 443
