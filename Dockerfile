FROM linuxserver/mariadb:11.4.4

COPY ./root-fs/docker-entrypoint-initdb.d/* /docker-entrypoint-initdb.d/
