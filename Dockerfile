FROM ruby:2.3.4
RUN apt-get update -qq && apt-get install -y build-essential\
  libsqlite3-dev nodejs imagemagick aptitude
## Install dependencies
RUN aptitude install -y graphviz
RUN mkdir /my_app
WORKDIR /my_app
ADD Gemfile /my_app/Gemfile
ADD Gemfile.lock /my_app/Gemfile.lock
RUN bundle install
ADD . /my_app
