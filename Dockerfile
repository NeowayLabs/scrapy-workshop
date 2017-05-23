FROM alpine:3.4

#Install python 3, duh

RUN apk add --update && \
    apk add --no-cache python3-dev && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --upgrade pip setuptools && \
    ln -s /usr/bin/python3 /usr/bin/python && \
    rm -r /root/.cache

#install compilers and libs
RUN apk add --update && \
    apk add ca-certificates gcc libxml2-dev libxslt-dev libffi-dev musl-dev openssl-dev && \
    rm /var/cache/apk/*

COPY ./requirements.txt /app/requirements.txt
RUN pip install -r /app/requirements.txt

ENV PYTHONPATH /app
ENV PYTHONDONTWRITEBYTECODE 1

WORKDIR /app