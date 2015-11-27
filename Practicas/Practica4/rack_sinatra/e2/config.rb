# ejecutando 'ruby config.rb' (rackup tambien funciona)
# Nota: approach mas "a mano"

require_relative 'appServer.rb'
require 'rack'
app = AppServer.new
Rack::Handler::WEBrick.run(app,{ :Port => 9090 })
