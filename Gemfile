source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.3'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 3.11'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

gem 'versionist', '~> 2.0.1'
gem 'active_model_serializers', '~> 0.10.10'
gem 'interactor', '~> 3.1.1'
gem 'httparty', '~> 0.17.0'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry-byebug', '~> 3.7.0'
  gem 'factory_bot_rails', '~> 5.0.2'
  gem 'rubocop', '~> 0.73.0'
  gem 'rubocop-rspec', '~> 1.34.0'
  gem 'faker', '~> 1.9.6'
end

group :test do
  gem 'database_cleaner', '~> 1.7.0'
  gem 'rspec-mocks', '~> 3.8.1'
  gem 'rspec-rails', '~> 3.8.2'
  gem 'shoulda-matchers', '~> 4.1.1'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end


# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
