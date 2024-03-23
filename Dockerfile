# Dockerfile.rails
FROM ruby:3.0.6 AS rails-toolbox

# Default directory
RUN mkdir /bloggonbian
WORKDIR /bloggonbian

# Install rails
RUN gem install bundler

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

# Run a shell
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
