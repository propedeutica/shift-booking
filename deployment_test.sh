#!/bin/bash

cp -f config/database.yml config/database_good.yml
cp -f config/database_openshift.yml config/database.yml
cp -f db/schema.rb db/schema.good.rb
RAILS_ENV=test bin/rails db:drop db:create db:migrate
bundle exec rake test
result=$?
mv -f db/schema.good.rb db/schema.rb
mv -f config/database_good.yml config/database.yml
exit $result
