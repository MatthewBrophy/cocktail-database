# require File.expand_path('../config/application', __FILE__)
# Rails.application.load_tasks

require_relative './config/environment'
require 'sinatra/activerecord/rake'

# Remember: use `rake -T` in your terminal to see 
# the list of available rake tasks

desc "Start our app console"
task :console do
  Pry.start
end

desc "Start up your CLI"
task :run do
  exec('ruby bin/run.rb')
end