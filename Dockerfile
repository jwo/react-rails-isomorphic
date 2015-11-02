FROM ruby:2.2.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev
RUN mkdir /react-docker
WORKDIR /react-docker
ADD Gemfile /react-docker/Gemfile
ADD Gemfile.lock /react-docker/Gemfile.lock
RUN bundle install
ADD . /react-docker
