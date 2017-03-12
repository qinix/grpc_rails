# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'grpc_rails/version'

Gem::Specification.new do |spec|
  spec.name          = "grpc_rails"
  spec.version       = GrpcRails::VERSION
  spec.authors       = ["Eric Zhang"]
  spec.email         = ["i@qinix.com"]

  spec.summary       = %q{: Write a short summary, because Rubygems requires one.}
  spec.description   = %q{: Write a longer description or delete this line.}
  spec.homepage      = "https://github.com/qinix/grpc_rails"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

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
