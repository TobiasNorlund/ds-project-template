FROM tensorflow/tensorflow:2.1.0-gpu-py3-jupyter

RUN mkdir -p /opt/project/src
WORKDIR /opt/project/src

COPY requirements.txt .
RUN pip install -r requirements.txt