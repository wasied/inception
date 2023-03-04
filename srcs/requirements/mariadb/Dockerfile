FROM debian:buster
LABEL maintainer="mpeharpr <mpeharpr@student.s19.be>"

# Packets installation
RUN apt-get update && apt-get install -y mariadb-server mariadb-client \
    && rm -rf /var/lib/apt/lists/*

# Allow remote access to the database
RUN sed -i 's/^bind-address\s.*$/bind-address = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf

# Import our custom files
RUN mkdir -p /tmp/
COPY ./tools/entrypoint.sh /tmp/entrypoint.sh
RUN chmod +x /tmp/entrypoint.sh

# Expose port
EXPOSE 3306

# Start the server
ENTRYPOINT ["/tmp/entrypoint.sh"]