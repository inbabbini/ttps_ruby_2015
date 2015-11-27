class AppServer

  def call(env)
    @status = 404
    @headers = {'content-type' => 'text/html'}
    @body = [ (Random::rand(42) + 1).to_s ]

    @status = 200 if @body.include? '42'

    [@status, @headers, @body]
  end

end
