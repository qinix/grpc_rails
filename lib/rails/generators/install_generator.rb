require 'rails/generators/base'

module Grpc
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path '../templates', __FILE__
    desc "Install grpc_rails file to your application."

    def mkdirs
      empty_directory 'app/services'
      empty_directory 'app/services/base'
      empty_directory 'app/services/protos'
    end

    def copy_config
      template 'grpc_rails.yml', 'config/grpc_rails.yml'
    end
  end
end
