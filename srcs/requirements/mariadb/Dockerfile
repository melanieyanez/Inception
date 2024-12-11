# Utiliser Alpine ou Debian comme base
FROM debian:bullseye

# Installer MariaDB
RUN apt-get update && apt-get install -y mariadb-server

# Créer les répertoires nécessaires et définir les permissions
RUN mkdir -p /var/lib/mysql && \
    chown -R mysql:mysql /var/lib/mysql

# Copier les fichiers de configuration (si nécessaires)
COPY conf/my.cnf /etc/mysql/my.cnf

# Ajouter un script d'initialisation (facultatif)
COPY tools/init.sql /docker-entrypoint-initdb.d/

# Exposer le port pour MariaDB
EXPOSE 3306

# Commande pour démarrer MariaDB
CMD ["mysqld"]
