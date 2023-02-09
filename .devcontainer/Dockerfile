FROM python:3.8

ARG KAT_DIR=/usr/share/kat
ARG ALGS4_DIR=/usr/share/java

RUN apt-get update && \
    # Install Java and download algs4.jar
    apt-get install -y openjdk-11-jdk && \
    wget https://algs4.cs.princeton.edu/code/algs4.jar && \
    mv algs4.jar ${ALGS4_DIR} && \
    # Install kat
    git clone -b 1.9.0-b https://github.com/marfavi/Kat.git ${KAT_DIR} && \
    python -m pip install -r ${KAT_DIR}/requirements.txt && \
    ln -s ${KAT_DIR}/kattis.py /usr/local/bin/kat && \
    ln -s ${KAT_DIR}/kattis.py /usr/local/bin/kattis && \
    # Add user
    useradd -ms /bin/bash programmer

# Add algs4.jar to the classpath
ENV CLASSPATH "$CLASSPATH:${ALGS4_DIR}/algs4.jar"


WORKDIR /workdir
USER programmer
