FROM ruby:2.3.1

RUN apt-get update -qq && apt-get install -y build-essential
RUN mkdir /vr-code-challenge

WORKDIR /vr-code-challenge

ADD Gemfile /vr-code-challenge/Gemfile
ADD Gemfile.lock /vr-code-challenge/Gemfile.lock

RUN bundle install

ADD . /vr-code-challenge
