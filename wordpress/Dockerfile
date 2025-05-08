FROM debian:buster-slim

RUN apt update -y && \
	apt install php-fpm php-mysql -y && \
	apt install -y curl

COPY ./script.sh /
COPY ./wp-config.php /
RUN chmod +x /script.sh

CMD ["/script.sh"]