FROM elixir:1.3.1


RUN apt-get update -qq && \
	apt-get install -y \
	locales \
	build-essential \
	libpq-dev \
	git \
	postgresql-client \
	inotify-tools


ENV PHOENIX_VERSION 1.2.0

RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get update
RUN apt-get install -y nodejs

RUN mix archive.install --force https://github.com/phoenixframework/archives/raw/master/phoenix_new-$PHOENIX_VERSION.ez

RUN mkdir /app
WORKDIR /app

ADD . /app

RUN mix local.hex --force

EXPOSE 4000
