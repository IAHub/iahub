FROM python:alpine

ADD https://archive.org/download/ia-pex/ia /bin/ia

WORKDIR /ia

RUN chmod +x /bin/ia
