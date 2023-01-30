FROM mcr.microsoft.com/devcontainers/java:11

# Download the algs4.jar library
RUN wget https://algs4.cs.princeton.edu/code/algs4.jar

# Move the algs4.jar library to the /usr/local/lib directory
RUN mv algs4.jar /usr/local/lib/

# Configure the container to include the algs4.jar library in its classpath
ENV CLASSPATH "$CLASSPATH:/usr/local/lib/algs4.jar"

# Create a working directory and set it as the working directory
RUN mkdir /app
WORKDIR /app

# Start the container with a shell
CMD ["/bin/sh"]
