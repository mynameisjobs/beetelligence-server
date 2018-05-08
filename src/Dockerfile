FROM ruby:2.5.1-alpine3.7
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN apk add --virtual build-dependencies --no-cache --update build-base \
                                linux-headers \
                                git \
                                postgresql-dev && \
    apk add --no-cache          nodejs \
                                tzdata && \
    bundle install --jobs `expr $(cat /proc/cpuinfo | grep -c "cpu cores") - 1` --retry 3
COPY . .
