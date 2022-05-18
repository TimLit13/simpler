module Simpler
  class Router
    class Route

      attr_reader :controller, :action, :path

      def initialize(method, path, controller, action)
        @method = method
        @path = path
        @controller = controller
        @action = action
        @params = {} 
      end

      def match?(method, path, env)
        @method == method && path_check(path, env)
      end

      private

      def path_check(path, env)
        request_path_parts = path.split('/')
        router_path_parts = @path.split('/')

        return false if request_path_parts.length != router_path_parts.length

        router_path_parts.each_with_index do |part, i|
          if part.start_with?(':')
            puts 'find : param'
            add_to_params(part, request_path_parts[i])
          else
            return false if part != request_path_parts[i]
          end
        end
        env['simpler.params'] = @params
      end

      def add_to_params(param, param_value)
        param_sym = param.delete(':').to_sym
        @params[param_sym] = param_value
      end
      
    end
  end
end
