FROM linuxserver/mariadb:11.8.8
ENV REMOTE_SQL=http://database
RUN ln -sf /var/lib/mysql /config/databases
RUN echo "# Disable binlogs" >> /defaults/custom.cnf
RUN echo "[mysqld]" >> /defaults/custom.cnf
RUN echo "skip-log-bin" >> /defaults/custom.cnf

# Build info: value of build arg BUILDINFO, falls back to the UTC build timestamp (YmdHis)
ARG BUILDINFO
RUN mkdir -p /image && echo "${BUILDINFO:-$(date -u +%Y%m%d%H%M%S)}" > /image/BUILDINFO
