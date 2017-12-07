source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.4'
gem 'mysql2'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'devise'
gem 'pundit', '~> 1.1'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails', '~> 4.3', '>= 4.3.1'
gem 'jbuilder', '~> 2.5'
gem 'haml', '~> 5.0', '>= 5.0.4'
gem 'omniauth-facebook'
gem 'bootstrap-sass', '~> 3.3', '>= 3.3.7'
gem 'will_paginate', '~> 3.1', '>= 3.1.6'
gem 'simple_form', '~> 3.5'
gem 'carrierwave', '~> 1.2', '>= 1.2.1'
gem 'mini_magick', '~> 4.8'

group :development, :test do
  gem "database_cleaner"    
  gem 'pry-byebug'
  gem 'rspec-rails', '~> 3.7', '>= 3.7.1'
  gem 'shoulda-matchers', '~> 3.0.0'
  gem 'rails-controller-testing'
  gem 'factory_girl_rails'
  gem 'faker'
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end  

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
