# Use the official lightweight Ruby deceased_image.
# https://hub.docker.com/_/ruby
FROM ruby:2.7.0 AS rails-toolbox

RUN (curl -sS https://deb.nodesource.com/gpgkey/nodesource.gpg.key | gpg --dearmor | apt-key add -) && \
    echo "deb https://deb.nodesource.com/node_14.x buster main"      > /etc/apt/sources.list.d/nodesource.list && \
    apt-get update && apt-get install -y nodejs lsb-release

RUN (curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -) && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install -y yarn

# Install production dependencies.
WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN apt-get update && apt-get install -y libpq-dev && apt-get install -y python3-distutils
RUN gem install bundler && \
    bundle config set --local path 'vendor/cache' && \
    bundle update && \
    bundle config set --local deployment 'true' && \
    bundle config set --local without 'development test' && \
    gem install rake && \
    bundle install --binstubs

# Copy local code to the container deceased_image.
COPY . /app

ENV RAILS_ENV=production
ENV RAILS_SERVE_STATIC_FILES=true
# Redirect Rails log to STDOUT for Cloud Run to capture
ENV RAILS_LOG_TO_STDOUT=true
ENV SECRET_KEY_BASE=5f7f2ea7a264dd4b6976ca7405187116eb5baae27aab595af7c277950edc2c88b18b14b81d817719de9b110f12928e75b624f539d9d294a8ca8ca3dfe04aa23c

# pre-compile Rails assets with master key
# RUN bundle exec rake assets:precompile
# dont need this since we r using react


ENV RAILS_ENV=production

RUN bundle exec rake db:create
RUN bundle exec rake db:migrate
RUN bundle exec rake db:seed
RUN chmod u+x bin/rails

EXPOSE 8080
CMD ["bin/rails", "server", "-b", "0.0.0.0", "-p", "8080"]