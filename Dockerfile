FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
	apt-get install -y \
	python3-pip \
	&& apt clean && rm -rf /var/lib/apt/lists/*

RUN pip3 install --extra-index-url https://google-coral.github.io/py-repo/ tflite_runtime

RUN pip3 install \
	awslambdaric

ENTRYPOINT [ "/usr/bin/python3", "-m", "awslambdaric" ]