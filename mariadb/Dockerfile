FROM debian:buster

RUN apt update -y && \
	apt install mariadb-server -y

COPY ./conf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./script.sh /
# COPY ./tools/dump.sql /


CMD ["/script.sh"]