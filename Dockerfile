FROM ubuntu:16.04
MAINTAINER seven-cheng

COPY /ubuntu-init.sh /ubuntu-init.sh
RUN chmod 777 /ubuntu-init.sh
CMD ["sh","/ubuntu-init.sh"]
