FROM ruby:3.1.2

ENV TZ Asia/Tokyo
ENV APP_ROOT /usr/src/app
ENV BUILD_PACKAGES="vim postgresql-client"

WORKDIR $APP_ROOT

RUN \
  apt-get update -qq && apt-get install -y $BUILD_PACKAGES --no-install-recommends && \
  apt-get clean && rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/* /tmp/* /var/tmp/*

COPY Gemfile $APP_ROOT/
COPY Gemfile.lock $APP_ROOT/
RUN \
  echo 'gem: --no-document' >> ~/.gemrc && \
  cp ~/.gemrc /etc/gemrc && \
  chmod uog+r /etc/gemrc && \
  bundle config build.nokogiri --use-system-libraries && \
  bundle config jobs 4 && \
  bundle install && \
  rm -rf ~/.gem

COPY . $APP_ROOT/

EXPOSE 3000

CMD ["rails", "db:migrate:reset", "&&", "rails", "server", "-b", "0.0.0.0"]
