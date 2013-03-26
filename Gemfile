source 'https://rubygems.org'

gem 'rails', '3.2.12'


gem 'thin'
# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

group :production, :staging do
  gem "pg"
end

group :development, :test do
  gem "sqlite3", "~> 1.3.0", :require => "sqlite3"
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'therubyracer', :platforms => :ruby
gem 'less-rails'

gem 'jquery-rails'

# To use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.0.0'

gem "sucker"
gem 'amazon-album-art', '>= 0.4', :git => 'https://github.com/samuelgiles/PatchedAmazonAlbumArt.git', :branch => "Master"

gem 'paperclip'

group :development do
  gem "rails-erd"
end

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
