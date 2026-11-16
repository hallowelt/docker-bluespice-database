FROM linuxserver/mariadb:11.8.8
ENV REMOTE_SQL=http://database
RUN ln -sf /var/lib/mysql /config/databases
RUN echo "# Disable binlogs" >> /defaults/custom.cnf
RUN echo "[mysqld]" >> /defaults/custom.cnf
RUN echo "skip-log-bin" >> /defaults/custom.cnf

# Build info: value of build arg BUILDINFO, `-` if not set
ARG BUILDINFO
RUN mkdir -p /image && echo "${BUILDINFO:--}" > /image/BUILDINFO
