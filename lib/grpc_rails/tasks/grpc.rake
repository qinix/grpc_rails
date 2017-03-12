namespace :grpc do
  desc 'Generate base services from protos defined in app/services/protos'
  task generate_base_services: [:environment] do
    exec "grpc_tools_ruby_protoc -I #{Rails.root}/app/services/protos --ruby_out=#{Rails.root}/app/services/base --grpc_out=#{Rails.root}/app/services/base #{Rails.root}/app/services/protos/*.proto"
  end
end
