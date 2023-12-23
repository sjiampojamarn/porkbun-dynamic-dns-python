ARG BUILD_FROM=alpine 
FROM ${BUILD_FROM}

RUN apk add --no-cache python3 py3-pip bind-tools curl bash \
  && rm -rf /var/cache/apk/*
  
RUN python3 -m venv .venv \
  && source .venv/bin/activate \
  && pip3 install requests

WORKDIR /
COPY ./porkbun-ddns.py ./
COPY ./entrypoint.sh ./
RUN chmod 755 ./entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]
