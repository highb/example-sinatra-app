FROM ruby:2.4.2
WORKDIR /app
ADD . /app
RUN bundle install
EXPOSE 3000
CMD [ "bundle", "exec", "app.rb" ]
