FROM krauthosting/ubi8-git-curl-jq:latest

COPY entrypoint.sh /entrypoint.sh
COPY cred-helper.sh /cred-helper.sh


RUN ["chmod", "+x", "/entrypoint.sh"]
RUN ["chmod", "+x", "/cred-helper.sh"]
ENTRYPOINT ["/entrypoint.sh"]
