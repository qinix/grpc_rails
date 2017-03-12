require "spec_helper"
require_relative 'rails_app/config/environment'
$:.unshift Dir.pwd
Dir['spec/rails_app/app/services/base/*.rb'].each { |f| require f.split('/').last.sub('.rb', '') }

RSpec.describe GrpcRails do

  it 'can get result from server' do
    server_process = Process.fork do
      Dir.chdir 'spec/rails_app/app'
      exec 'bundle exec grpc_server'
    end
    sleep 3
    stub = Helloworld::Greeter::Stub.new('localhost:3001', :this_channel_is_insecure)
    message = stub.say_hello(Helloworld::HelloRequest.new(name: 'world')).message
    Process.kill 'TERM', server_process
    Process.wait
  end

end
