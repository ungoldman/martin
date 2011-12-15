Encoding.default_internal = 'UTF-8'
require 'rubygems'
require 'bundler/setup'
Bundler.require
require File.join(File.expand_path(File.dirname(__FILE__)), 'helpers.rb')
Dir.glob(['lib', 'models'].map! {|d| File.join File.expand_path(File.dirname(__FILE__)), d, '*.rb'}).each {|f| require f}

TIMEZONE = 'US/Pacific'

class App < Sinatra::Base
  register Sinatra::Namespace
  register Sinatra::Flash

  set :raise_errors,    false
  set :show_exceptions, false
  set :method_override, true
  set :public,          'public'
  set :sessions,        true
  set :session_secret,  'kualalumpurgibraltaremexico'
  set :erb,             :escape_html => true

  mime_type :ttf, 'font/ttf'
  mime_type :woff, 'application/octet-stream'

  configure :development do
    use Rack::CommonLogger
    Bundler.require :development
    DataMapper.setup :default, "sqlite3:///#{File.expand_path(File.join(File.dirname(__FILE__)))}/#{Sinatra::Base.environment}.db"
  end

  configure :test do
    use Rack::CommonLogger
    Bundler.require :test
    DataMapper.setup :default, "sqlite3:///#{File.expand_path(File.join(File.dirname(__FILE__)))}/#{Sinatra::Base.environment}.db"
  end

  configure :production do
    DataMapper.setup :default, ENV['DATABASE_URL']
  end

  not_found do
    erb :'404'
  end

  error do
    # Implement error reporting such as Airbrake (formerly Hoptoad) here.
    erb :'500'
  end
end

require File.join('.', 'app.rb')

puts "Starting in #{Sinatra::Base.environment} mode #{Time.now} (#{TIMEZONE})"
