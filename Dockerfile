FROM alpine:latest
ENV LANG="en_US.UTF-8" LANGUAGE="en_US:ja" LC_ALL="en_US.UTF-8"

# install neovim
RUN apk update && \
    apk add --update --no-cache --virtual .builddeps curl wget make unzip git \
            linux-headers musl-dev openssl-dev outils-md5 \
            pcre-dev cmake g++ libtool automake autoconf && \
    apk add --update --no-cache \
            python2-dev python3-dev gettext-dev \
            nodejs npm ruby-dev neovim &&\
# setup neovim
    curl -kL https://bootstrap.pypa.io/get-pip.py | python && \
    curl -kL https://bootstrap.pypa.io/get-pip.py | python3 && \
    python -m pip install pynvim && \
    python3 -m pip install pynvim neovim-remote && \
    npm install -g neovim && \
    gem install neovim && \
# remove
    apk del --purge .builddeps 

