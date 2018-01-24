ruby File.read(".ruby-version").strip

source "https://rubygems.org"

gem "rails", "5.1.0"
gem "unicorn", "~> 5.1.0"
gem "logstasher", "0.6.2"
gem "govuk_app_config"
group :development, :test do
  gem "pry"
  gem "simplecov-rcov", require: false
  gem "simplecov", require: false
  gem "govuk-lint"
  gem "factory_girl_rails"
  gem "timecop"
  gem "webmock", require: false
  gem "rspec-rails"
  gem "byebug" # Comes standard with Rails
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem "web-console", "~> 2.0"
  gem 'listen', '~> 3.1', '>= 3.1.5'
end
