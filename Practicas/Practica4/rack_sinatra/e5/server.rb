# bundler setup
require 'bundler'
Bundler.require

#server logic
NUM_REGEXP = /\A[-+]?[0-9]*\.?[0-9]+\Z/

# NumberScratcher middleware (e6)
require_relative '../e6.rb'

# XCounter middleware (e7)
require_relative '../e7.rb'


# Middlewares setup
# (e7) Para que XCounter trabaje antes que NumberScratcher,
# se agregan los MD en este orden para que la secuencia
# request/response sea:
#   Request: Cli -> NumberScratcher -> XCounter -> Sinatra(process)
#   Response: Sinatra -> XCounter(process) ->NumberScratcher(process) -> Cli
use NumberScratcher
use XCounter

# endpoints setup

# '/' => endpoints list
get '/' do
  @body = [
    "'/' => endpoints list \n",
    "'/mcm/:a/:b' => return mcm between :a and :b \n",
    "'/mcd/:a/:b' => return mcd between :a and :b \n",
    "'/sum/*' => return sumatory of all * params separated with '/' \n",
    "'/even/*' => return quantity of even number among * params separated with '/' \n",
    "'/random' => return random number \n",
    "'/random/:lower/:upper' => return random number between :lower and :upper \n"
  ]
  # return status headers and body
  [200, {}, @body]
end

# '/mcm/:a/:b' => return mcm (lcm) between :a and :b
get '/mcm/:a/:b' do
  if (params[:a] =~ NUM_REGEXP) && (params[:b] =~ NUM_REGEXP)
    @body = params[:a].to_i.lcm(params[:b].to_i)
    [200, {}, @body.to_s]
  else
    400
  end
end

# '/mcd/:a/:b' => return mcd (gcd) between :a and :b
get '/mcd/:a/:b' do
  if (params[:a] =~ NUM_REGEXP) && (params[:b] =~ NUM_REGEXP)
    @body = params[:a].to_i.gcd(params[:b].to_i)
    [200,{}, @body.to_s]
  else
    400
  end
end

# '/sum/*' => return sumatory of all * params, separated with '/'
get '/sum/*' do
  @body = params[:splat].first.split('/').inject(0){|sum, num| sum+= num.to_i rescue 0}.to_s
  [200,{}, @body]
end

# '/even/*' => return quantity of even number among * params
get '/even/*' do
  @body = params[:splat].first.split('/').delete_if{|num| num.to_i.odd? }.size.to_s
  [200,{}, @body]
end

# '/random' => return random number
post '/random' do
  @body = Random::rand.to_s
  [200,{}, @body]
end

# '/random/:lower/:upper' => return random number between :lower and :upper
post '/random/:lower/:upper' do |lower, upper|
  if (lower =~ NUM_REGEXP) && (upper =~ NUM_REGEXP) && (lower < upper)
    @body = Random::rand(upper.to_i)
    @body = Random::rand(upper.to_i) until @body >= lower.to_i
    [200,{}, @body.to_s]
  else
    400
  end
end
