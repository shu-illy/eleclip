#!/bin/sh

if [ "${RAILS_ENV}" = "production" ]
then
  bundle exec rails assets:precompile
fi

echo docker image updated at 20210216


# bundle exec rails s -p ${PORT:-3000} -b 0.0.0.0
# bundle exec unicorn -p 3000 -c /electronote/config/unicorn.rb
