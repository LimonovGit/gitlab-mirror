FROM ubuntu:20.04

COPY entrypoint.sh /entrypoint.sh
COPY cred-helper.sh /cred-helper.sh

RUN apt update
RUN apt install -y git
RUN ["chmod", "+x", "/entrypoint.sh"]
RUN ["chmod", "+x", "/cred-helper.sh"]
ENTRYPOINT ["/entrypoint.sh"]

