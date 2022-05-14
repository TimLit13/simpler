class TestsController < Simpler::Controller

  def index
    @time = Time.now

    status 201

    headers['Content-Type'] = 'text/plain'
    headers['Debug-simpler-header'] = 'debug-simpler'

    render plain: "Plain text response"
  end

  def show
    @test_id = params[:id]
    #render plain: "Here should be test with id = #{@test_id}"
  end

  def create
    render plain: "Created"
  end

end
