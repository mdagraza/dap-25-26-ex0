FROM debian:12.13-slim@sha256:74d56e3931e0d5a1dd51f8c8a2466d21de84a271cd3b5a733b803aa91abf4421 as debian

RUN apt update && apt install curl unzip -y

RUN curl -o /db.zip https://downloads.mysql.com/docs/world-db.zip
RUN unzip -j /db.zip '**/*.sql' -d db-mysql

#MYSQL
FROM mysql:8.0.45-debian@sha256:1ae7ba07e714856c61aa0d559a8f1a788eb8f25bd0b5b71738a1bdd6798bc022

COPY --from=debian  /db-mysql ./docker-entrypoint-initdb.d