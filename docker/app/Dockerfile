FROM ruby:2.7

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -

RUN apt-get update && apt-get install -y \
    build-essential \
    nodejs \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /sample-app

WORKDIR /sample-app
