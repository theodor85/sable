# frozen_string_literal: true

require_relative "lib/sable/version"

Gem::Specification.new do |spec|
  spec.name          = "sable"
  spec.version       = Sable::VERSION
  spec.authors       = ["Teddy Coder"]
  spec.email         = ["fedor_coder@mail.ru"]

  spec.summary       = "Library for parsing pages of the same type"
  spec.description   = "Library for parsing pages of the same type"
  spec.homepage      = "https://github.com/theodor85/sable"
  spec.required_ruby_version = ">= 2.4.0"

  spec.metadata["allowed_push_host"] = "TODO: Set to 'https://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency 'dry-monads', '~> 1.4'
  spec.add_dependency 'dry-container', '~> 0.9.0'
  spec.add_dependency 'dry-auto_inject', '~> 0.8.0'

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
