
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "dahlia_data_models/version"

Gem::Specification.new do |spec|
  spec.name          = "dahlia_data_models"
  spec.version       = DahliaDataModels::VERSION
  spec.authors       = ["Catherine Callaghan"]
  spec.email         = ["catherine.callaghan@exygy.com"]

  spec.summary       = 'Provide models and services for DAHLIA.'
  spec.homepage      = 'https://github.com/Exygy/dahlia_data_models'
  spec.license       = 'GPL-3.0'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = 'https://github.com/Exygy/dahlia_data_models'
    spec.metadata["changelog_uri"] = 'https://github.com/Exygy/dahlia_data_models'
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) || f.match(/\.gem$/) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "rails", "~> 5.1"
  spec.add_runtime_dependency "awesome_nested_set", "~> 3.1"

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 12.3"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rspec-rails"
  spec.add_development_dependency "database_cleaner"
  spec.add_development_dependency "sqlite3"
end
