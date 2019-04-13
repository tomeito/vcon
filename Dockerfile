FROM ruby:2.5.3

ENV LANG C.UTF-8

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN gem install bundler

ARG APP_HOME

RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

ADD Gemfile $APP_HOME/
ADD Gemfile.lock $APP_HOME/

RUN bundle install --jobs=10