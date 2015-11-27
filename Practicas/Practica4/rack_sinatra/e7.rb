class XCounter
  def initialize(app)
    @app = app
  end

  def call(env)
    #pass request
    @status, @headers, @body = @app.call(env)
    #scan body
    xcount = @body.inject(0) {|sum, line| sum += line.count("xX")}
    #add header
    puts "----------------" + xcount.to_s + "----------------"
    @headers["X-XS-COUNT"] = xcount.to_s
    #pass along response
    [@status,@headers,@body]
  end
end
