# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'grpc_rails/version'

Gem::Specification.new do |spec|
  spec.name          = "grpc_rails"
  spec.version       = GrpcRails::VERSION
  spec.authors       = ["Eric Zhang"]
  spec.email         = ["i@qinix.com"]

  spec.summary       = %q{Support writting gRPC services inside Rails}
  spec.description   = %q{Support writting gRPC services inside Rails}
  spec.homepage      = "https://github.com/qinix/grpc_rails"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "bin"
  spec.executables   << 'grpc_server'
  spec.require_paths = ["lib"]

  spec.add_dependency 'railties', '>= 4.1.0'
  spec.add_dependency 'grpc', '~> 1.1'
  spec.add_dependency 'grpc-tools', '~> 1.1'
end
