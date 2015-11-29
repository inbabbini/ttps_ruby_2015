# Setup Bundler
require 'bundler'
Bundler.require

# Load Application
require_relative 'application.rb'

# Setup endpoints

# POST '/' => start a game, redirect to game
post '/' do
  game_id = Random::rand Hangman::current_games_count()
  redirect to("game/#{game_id}")
end

# GET 'game/:id' => return game status for that word
get '/game/:id' do | gid |
  @body = [Hangman::getGameStatus(gid.to_i)]
  [200,{},@body]
end

# PUT 'game/:id' => make an attempt to guess a letter
# Accepts 'letter' as a PUT parameter (on the body)
put '/game/:id' do | gid |
  letter = params[:letter]
  @body = Hangman::attempt(gid.to_i,letter)
  redirect to("game/#{gid}")
end
