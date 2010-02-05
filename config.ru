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
