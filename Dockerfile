FROM mariadb:11.4-noble

COPY ./root-fs/docker-entrypoint-initdb.d/* /docker-entrypoint-initdb.d/
