FROM ubuntu:18.04

# install packages
RUN apt-get update
RUN apt-get install -y curl
RUN apt-get install -y git-core
RUN apt-get install -y python3-pip
RUN pip3 install awscli

# install chrome packages
RUN apt-get install -y gconf-service
RUN apt-get install -y libasound2
RUN apt-get install -y libatk1.0-0
RUN apt-get install -y libatk-bridge2.0-0
RUN apt-get install -y libc6
RUN apt-get install -y libcairo2
RUN apt-get install -y libcups2
RUN apt-get install -y libdbus-1-3
RUN apt-get install -y libexpat1
RUN apt-get install -y libfontconfig1
RUN apt-get install -y libgcc1
RUN apt-get install -y libgconf-2-4
RUN apt-get install -y libgdk-pixbuf2.0-0
RUN apt-get install -y libglib2.0-0
RUN apt-get install -y libgtk-3-0
RUN apt-get install -y libnspr4
RUN apt-get install -y libpango-1.0-0
RUN apt-get install -y libpangocairo-1.0-0
RUN apt-get install -y libstdc++6
RUN apt-get install -y libx11-6
RUN apt-get install -y libx11-xcb1
RUN apt-get install -y libxcb1
RUN apt-get install -y libxcomposite1
RUN apt-get install -y libxcursor1
RUN apt-get install -y libxdamage1
RUN apt-get install -y libxext6
RUN apt-get install -y libxfixes3
RUN apt-get install -y libxi6
RUN apt-get install -y libxrandr2
RUN apt-get install -y libxrender1
RUN apt-get install -y libxss1
RUN apt-get install -y libxtst6
RUN apt-get install -y ca-certificates
RUN apt-get install -y fonts-liberation
RUN apt-get install -y libappindicator1
RUN apt-get install -y libnss3
RUN apt-get install -y lsb-release
RUN apt-get install -y xdg-utils
RUN apt-get install -y wget

# create user 1000
RUN addgroup --gid 1000 user
RUN adduser --disabled-password --gecos '' --gid 1000 --uid 1000 user
USER user

# install nvm
ENV NVM_DIR /home/user/.nvm
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
