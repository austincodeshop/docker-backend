FROM ubuntu:18.04

RUN apt-get update \
    && apt-get install -y curl git-core python3-pip \
    && curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash \
    && export NVM_DIR="$HOME/.nvm" && [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" \
    && nvm install 10 \
    && pip3 install awscli