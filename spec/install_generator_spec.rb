require 'spec_helper'
require 'generator_spec'
require 'rails/generators/install_generator'

describe Grpc::InstallGenerator, type: :generator do
  destination File.expand_path('../../tmp', __FILE__)
  before :all do
    prepare_destination
    run_generator
  end

  it 'creates right file structure' do
    expect(destination_root).to have_structure {
      directory 'app' do
        directory 'services' do
          directory 'base'
          directory 'protos'
        end
      end

      directory 'config' do
        file 'grpc_rails.yml'
      end
    }
  end
end
