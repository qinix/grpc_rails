require 'grpc'

module GrpcRails
  class Server
    EXECUTABLES = ['bin/rails', 'script/rails']

    def initialize(host='0.0.0.0', port=3001, env='development')
      @host = host
      @port = port
      ENV['RAILS_ENV'] = env
    end

    def services
      Dir["#{Rails.root}/app/services/**/*.rb"].each { |f| require f }

      Dir["#{Rails.root}/app/services/*.rb"].map do |file|
        class_name = file.split('/').last.sub(/\.rb$/, '').camelize
        Object.const_get class_name
      end
    end

    def serve
      load_rails_environment!

      @server ||= GRPC::RpcServer.new
      @server.add_http2_port "#{@host}:#{@port}", :this_port_is_insecure
      services.each { |service| @server.handle service }
      @server.run_till_terminated
    end

    private

    def load_rails_environment!
      loop do
        if exe = find_executable
          Object.const_set(:APP_PATH, File.expand_path('config/application', Dir.pwd))
          require File.expand_path('../environment', APP_PATH)
          break
        end

        raise 'You are not in Rails project' if Pathname.new(Dir.pwd).root?

        # Otherwise keep moving upwards in search of an executable.
        Dir.chdir('..')
      end
    end

    def find_executable
      EXECUTABLES.find { |exe| File.file?(exe) }
    end
  end
end
