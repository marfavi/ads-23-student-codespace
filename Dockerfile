# Use the eclipse-temurin:11-alpine as the base image
FROM eclipse-temurin:11-alpine

# Set environment variables for Python version
ENV PYTHON_VERSION 3.8.0

# Install pyenv and dependencies
RUN apk update && \
    apk add --no-cache \
    bash \
    git \
    build-base \
    readline-dev \
    zlib-dev \
    bzip2-dev \
    openssl-dev

# Install pyenv
RUN git clone https://github.com/pyenv/pyenv.git /root/.pyenv
ENV PYENV_ROOT /root/.pyenv
ENV PATH $PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH

# Install Python
RUN pyenv install ${PYTHON_VERSION}
RUN pyenv global ${PYTHON_VERSION}

# Install itu.algs4 library
RUN pip install itu.algs4

# Download the algs4.jar library
RUN wget https://algs4.cs.princeton.edu/code/algs4.jar

# Move the algs4.jar library to the lib directory of the openjdk-jre library
RUN mv algs4.jar /usr/lib/jvm/java-11-openjdk/lib/

# Configure the container to include the algs4.jar library in its classpath
ENV CLASSPATH "$CLASSPATH:/usr/lib/jvm/java-11-openjdk/lib/algs4.jar"

# Create a working directory and set it as the working directory
RUN mkdir /app
WORKDIR /app

# Start the container with a shell
CMD ["/bin/sh"]
