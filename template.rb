#!/usr/bin/env ruby -wKU

gem_group :development do
  gem 'helproku'
end

run "bundle install"

generate("helproku:init")