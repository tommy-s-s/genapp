source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem "rails", "~> 7.0.3"
gem "puma", "~> 5.0"
gem "sassc-rails"
gem "sprockets-rails"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "bootsnap", require: false

#add
gem 'bcrypt'
gem 'bootstrap-sass'
gem 'faker'
gem 'will_paginate'
gem 'bootstrap-will_paginate'
#add
#gem 'jquery-rails'
gem 'cocoon'

group :development, :test do
  gem "sqlite3", "~> 1.4"
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  gem "web-console"
  gem "spring"

end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
  #add
  gem "rails-controller-testing"
  gem "minitest"
  gem "minitest-reporters"
  gem "guard"
  gem "guard-minitest"
end

group :production do
  gem "mysql2", "0.5.3"
end

gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
