FROM ubuntu:20.04

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]