FROM ruby:3.1.2

# Install nodejs on the default ruby 3 image
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash - && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && apt-get install -y build-essential nodejs yarn libsodium23

WORKDIR /app

COPY Gemfile ./Gemfile
COPY Gemfile.lock ./Gemfile.lock
COPY package.json ./package.json
COPY yarn.lock ./yarn.lock
COPY tailwind.config.js ./tailwind.config.js
COPY vite.config.ts ./vite.config.ts
RUN bundle install
RUN yarn

COPY . .

CMD ["bin/rails", "console"]
