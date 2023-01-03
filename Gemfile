source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.6.3"

gem "rails", "~> 5.2.4"
gem "pg", ">= 0.18", "< 2.0"
gem "puma", "~> 4.3"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "slim"
gem "slim-rails"
gem "turbolinks", "~> 5"
gem "bcrypt", "~> 3.1.7"
gem "bootsnap", ">= 1.1.0", require: false
gem "bootstrap-sass", "3.4.1"
gem "httparty", "~> 0.21.0"
gem "figaro", "~> 1.1", ">= 1.1.1"
gem "capybara"

group :development, :test do
  gem "rspec-rails", "~> 4.0.0"
  gem "byebug"
  gem "factory_bot_rails"
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :test do
  gem "vcr"
  gem "webmock"
end
