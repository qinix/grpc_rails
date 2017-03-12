require 'rails/railtie'

module GrpcRails
  class Railtie < Rails::Railtie
    initializer 'grpc_rails.initialization' do |app|
      $:.unshift "#{app.root}/app/services/base"
    end

    rake_tasks do
      current_path = File.expand_path('..', __FILE__)
      Dir["#{current_path}/tasks/*.rake"].each { |f| load f }
    end

    generators do
      current_path = File.expand_path('..', __FILE__)
      Dir["#{current_path}/../rails/generators/*.rb"].each { |f| require_relative f }
    end
  end
end
