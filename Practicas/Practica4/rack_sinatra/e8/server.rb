# Setup Bundler
require 'bundler'
Bundler.require

# Load Application
require_relative 'application.rb'

# Setup endpoints

# POST '/' => start a game, redirect to game
post '/' do
end

# GET 'game/:id' => return game status for that word
get 'game/:id' do
end

# PUT 'game/:id' => make an attempt to guess a letter
# Accepts 'letter' as a PUT parameter (on the body)
put 'game/:id' do
end
