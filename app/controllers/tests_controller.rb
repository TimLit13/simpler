class TestsController < Simpler::Controller

  def index
    @time = Time.now

    status 201

    headers['Content-Type'] = 'text/plain'
    headers['Debug-simpler-header'] = 'debug-simpler'

    render plain: "Plain text response"
  end

  def create

  end

end
