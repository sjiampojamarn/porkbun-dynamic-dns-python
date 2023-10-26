ARG BUILD_FROM=alpine 
FROM ${BUILD_FROM}

RUN apk add --no-cache python3 py3-pip bind-tools curl bash \
  && rm -rf /var/cache/apk/*
  
RUN pip3 install requests

WORKDIR /
COPY ./porkbun-ddns.py ./
COPY ./entrypoint.sh ./
RUN chmod 755 ./entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]
