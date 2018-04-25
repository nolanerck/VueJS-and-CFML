FROM mysql
MAINTAINER  Nolan Erck, nolan@southofshasta.com

# Copy the database schema to the /data directory
COPY ./devsetup/create-popculturedb.sql /data/create-popculturedb.sql

# Change the working directory
WORKDIR data

CMD mysql -u $MYSQL_USER -p $MYSQL_PASSWORD $MYSQL_DATABASE --binary-mode=1 < create-popculturedb.sql
