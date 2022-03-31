# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem 'bootsnap',   '1.4.5', require: false
gem 'jbuilder',   '2.9.1'
gem 'puma',       '4.3.12'
gem 'rails',      '6.0.2.2'
gem 'sass-rails', '5.1.0'
gem 'turbolinks', '5.2.0'
gem 'webpacker',  '4.0.7'
gem 'haml'
gem 'devise'
gem 'faker', git: 'https://github.com/stympy/faker.git', branch: 'master'


group :development, :test do
  gem 'byebug',  '11.0.1', platforms: %i[mri mingw x64_mingw]
  gem 'sqlite3', '1.4.1'
end

group :development do
  gem 'listen', '3.1.5'
  gem 'rubocop', '~> 0.80.1', require: false
  gem 'spring',                '2.1.0'
  gem 'spring-watcher-listen', '2.0.1'
  gem 'web-console',           '4.0.1'
  gem 'pry', '~> 0.12.2'
end

group :test do
  gem 'capybara',           '3.28.0'
  gem 'selenium-webdriver', '3.142.4'
  gem 'webdrivers',         '4.1.2'
end

group :production do
  gem 'pg', '1.1.4'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
