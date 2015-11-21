source 'https://rubygems.org'
ruby '2.2.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.4'
gem 'pg', '~> 0.18'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

gem 'jquery-rails', '~> 4.0'
gem 'turbolinks', '~> 2.5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'goodwill', '>= 0.3.0'
gem 'devise', '~> 3.5'
gem 'font-awesome-rails', '~> 4.4'
gem 'ledermann-rails-settings', '~> 2.4'
gem 'puma', '~> 2.14'

source 'https://rails-assets.org' do
  gem 'rails-assets-bootstrap', '~> 3.3'
  gem 'rails-assets-datatables', '~> 1.10'
  gem 'rails-assets-datatables-plugins', '~> 1.10'
  gem 'rails-assets-mouse0270--bootstrap-notify', '~> 3.1'
  gem 'rails-assets-selectize', '~> 0.12'
  gem 'rails-assets-timeago', '~> 1.4'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'pry'
  gem 'byebug'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :production do
  # Needed for Heroku
  gem 'rails_12factor'
end
