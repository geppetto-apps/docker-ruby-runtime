ARG RUBY_VERSION
FROM ruby:${RUBY_VERSION}
LABEL maintainer "Theodor Tonum <post@ttholding.no>"
ENV REFRESHED_AT=2018-02-10
RUN apt-get update -yqq && apt-get install -yqq apt-transport-https && apt-get upgrade -yqq
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get install -yqq yarn nodejs

# Update rubygems and bundler
RUN gem update --system
RUN gem install bundler
