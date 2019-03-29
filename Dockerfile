FROM ubuntu:18.04

# install packages
RUN apt-get update
RUN apt-get install -y curl
RUN apt-get install -y git-core
RUN apt-get install -y python3-pip
RUN pip3 install awscli

# install nvm
ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 10.15.3
RUN mkdir $NVM_DIR
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
RUN . $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

# configure node
ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH
