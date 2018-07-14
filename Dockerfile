FROM python:3.6-alpine
MAINTAINER Jacob Tomlinson <jacob@tom.linson.uk>

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

RUN apk update && apk add git bash
RUN pip3 install --upgrade pip
RUN pip3 install git+git://github.com/opsdroid/opsdroid.git
RUN pip3 install matrix_client
RUN pip3 install mtgsdk

EXPOSE 8080

COPY ./configuration.yaml /etc/opsdroid/configuration.yaml

CMD ["python", "-m", "opsdroid"]
