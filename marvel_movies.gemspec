# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'marvel_movies/version'

Gem::Specification.new do |spec|
  spec.name          = "marvel_movies"
  spec.version       = MarvelMovies::VERSION
  spec.authors       = ["Shaun McClain"]
  spec.email         = ["mcclains2003@gmail.com"]

  spec.summary       = "A Gem that returns all new, current and past Marvel Movies."
  spec.description   = "This Gem scrapes movies from the Marvel website and then displays them. You can choose a movie from the list it displays to see more information about it."
  spec.homepage      = "https://github.com/mcclains2003/marvel_movies.git"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_runtime_dependency 'nokogiri', '~> 1.6', '>= 1.6.0'
end
