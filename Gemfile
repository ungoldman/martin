source :rubygems
gem 'thin',                '1.2.11'
gem 'yajl-ruby',           '0.8.2', :require => 'yajl/json_gem'
gem 'sinatra',             '1.2.6', :require => 'sinatra/base'
gem 'sinatra-namespace',   '0.6.1', :require => 'sinatra/namespace'
gem 'sinatra-flash',       '0.3.0', :require => 'sinatra/flash'
gem 'rake',                '0.9.2', :require => nil
gem 'data_mapper',         '>= 1.1'
gem 'heroku'

group :production do
  gem 'dm-postgres-adapter'
end

group :development do
  gem 'dm-sqlite-adapter'
  gem 'shotgun',      :require => nil
  gem 'ruby-debug19', :require => 'ruby-debug'
end

group :test do
  gem 'rack-test',         '0.5.6', :require => 'rack/test'
  gem 'wrong',             '0.5.0'
  gem 'webmock',           '1.7.4'
end
