ARG TAG
FROM tensorflow/tensorflow:$TAG

RUN mkdir -p /opt/project/src
WORKDIR /opt/project/src

COPY requirements.txt .
RUN pip install -r requirements.txt