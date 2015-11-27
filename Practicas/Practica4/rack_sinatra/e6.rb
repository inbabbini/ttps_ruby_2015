class NumberScratcher
  def initialize(app)
    @app = app
  end

  def call(env)
    # pass requests
    @status, @headers, @body = @app.call(env)
    #retouch response body
    @body = @body.map {|line| line.tr('0-9', 'X')}
    puts "body curated"
    #return response
    [@status, @headers, @body]
  end
end
