require 'toto'
require 'config/environment.rb'

use Rack::Static, :urls => ['/stylesheets', '/javascripts', '/images', '/favicon.ico'], :root => 'public'
use Rack::ShowExceptions
use Rack::CommonLogger

# Run application
toto = Toto::Server.new do
  Toto::Paths = {
    :templates => "blog/templates",
    :pages => "blog/templates/pages",
    :articles => "blog/articles"
  }

  set :title, "The Lotto Project Blog"
  set :date, lambda {|now| now.strftime("%B #{now.day.ordinal} %Y") }
  set :summary,   :max => 500
  set :root, "blog"
  set :url, "http://the-lotto-project.com/blog/"
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
