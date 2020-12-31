require_relative 'lib/repocrate/version'

Gem::Specification.new do |spec|
  spec.name          = "repocrate"
  spec.version       = Repocrate::VERSION
  spec.authors       = ["Nick Flueckiger"]
  spec.email         = ["nick.flueckiger@renuo.ch"]

  spec.summary       = "A utility to update applications that are built from source"
  spec.description   = "A utility to update applications that are built from source" 
  spec.homepage      = "https://github.com/Liberatys/repocrate"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "http://mygemserver.com"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/Liberatys/repocrate"
  spec.metadata["changelog_uri"] = "https://github.com/Liberatys/repocrate/CHANGELOG.md"

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_dependency 'toml', '~> 0.2.0'
  spec.add_dependency 'colorize', '~> 0'
  spec.add_dependency 'commander', '~> 4.0'
  spec.add_dependency 'ruby-progressbar', '~> 1.11'
end
