FROM debian:latest

MAINTAINER Moeyard TRAN "moeyard@moeyard.com"

RUN 	apt update && \
	apt  install -y wget procps && \
	wget http://soft.vpser.net/lnmp/lnmp1.6.tar.gz -cO lnmp1.6.tar.gz && \
	tar zxf lnmp1.6.tar.gz && \
	cd lnmp1.6 && \
	LNMP_Auto="y" DBSelect="5" DB_Root_Password="moeyard" InstallInnodb="y" PHPSelect="9" SelectMalloc="1" ./install.sh lnmp && \
	apt clean

RUN echo 'root:root' |chpasswd

EXPOSE 22
EXPOSE 80
EXPOSE 443
