require 'sinatra'
require_relative '../e2/appServer.rb'

get '/' do
  AppServer.new.call(nil)
end
