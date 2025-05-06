FROM debian:buster-slim

RUN apt update -y && \
	apt install mariadb-server -y

COPY ./conf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./script.sh /
COPY ./dump.sql /

CMD ["/script.sh"]