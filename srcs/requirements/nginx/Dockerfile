FROM debian:bullseye

RUN apt update -y && apt upgrade -y
RUN apt-get install -y nginx

COPY tools/init_nx.sh /usr/local/init_nx.sh
RUN chmod +x /usr/local/init_nx.sh

EXPOSE 443

ENTRYPOINT [ "sh", "/usr/local/init_nx.sh" ]