require 'toto'
require 'config/environment.rb'

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
end


app = Rack::Builder.new do
	use Rack::CommonLogger
	
	map '/blog' do
		run toto
	end
	
	map '/' do
		use Rails::Rack::Static
		run ActionController::Dispatcher.new
	end
end.to_app

run app
