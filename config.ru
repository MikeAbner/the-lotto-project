
map '/' do
  require "config/environment" 
  use Rails::Rack::LogTailer 
  use Rails::Rack::Static 
  run ActionController::Dispatcher.new
end

require 'toto'

# Rack config
use Rack::Static, :urls => ['/css', '/javascripts', '/images', '/favicon.ico'], :root => 'public'
use Rack::ShowExceptions
use Rack::CommonLogger

# Run application
toto = Toto::Server.new do
  #
  # Add your settings here
  # set [:setting], [value]
  #
  set :title, "The Lotto Project Blog"
  set :date, lambda {|now| now.strftime("%B #{now.day.ordinal} %Y") }
  set :summary,   :max => 500
  set :url, "http://tlp-test-blog.heroku.com" 
end

map '/blog' do
  run toto
end