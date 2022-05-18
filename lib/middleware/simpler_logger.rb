require 'logger'

class AppLogger
  def initialize(app, **options)
    @logger = Logger.new(options[:logdev] || STDOUT)
    @app = app
  end

  def call(env)
    response = @app.call(env)
    @logger.info(make_log_info(env, response))
    response
  end

  private

  def make_log_info(env, response)
    <<~LOG_INFO
      

      #{"=" * 80}
      REQUEST:

      HTTP method:  "#{env['REQUEST_METHOD']}"
      URL:          "#{env['REQUEST_URI']}"
      Controller:   "#{env['simpler.controller']}"
      Action:       "#{env['simpler.action']}"
      Params:       "#{env['simpler.params']}"
      #{"-" * 80}

      RESPONSE: 

      Response status:  "#{response[0]}"
      Response type:    "#{response[1]['Content-Type']}"
      Response template:"#{env['simpler.response.template_path']}"
      #{"=" * 80}
    LOG_INFO
  end
end