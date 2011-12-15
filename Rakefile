require 'rubygems'
require 'bundler'
Bundler.setup
require 'rake/testtask'
require 'dm-migrations'

desc "Run all tests"
Rake::TestTask.new do |t|
  t.libs << "spec"
  t.test_files = FileList['spec/*_spec.rb']
  t.verbose = true
end

task :default => :test

task :environment do
  require File.join(File.dirname(__FILE__), 'env.rb')
end

namespace :db do
  desc 'Auto-migrate the database (destroys data)'
  task :bootstrap => :environment do
    puts "Bootstrapping database..."
    DataMapper.auto_migrate!
  end

  desc 'Auto-upgrade the database (preserves data)'
  task :migrate => :environment do
    puts "Migrating database..."
    DataMapper.auto_upgrade!
  end
end
