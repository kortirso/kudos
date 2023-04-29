# frozen_string_literal: true

require_relative 'lib/kudos/version'

Gem::Specification.new do |spec|
  spec.name        = 'kudos'
  spec.version     = Kudos::VERSION
  spec.authors     = ['Bogdanov Anton']
  spec.email       = ['kortirso@gmail.com']
  spec.homepage    = 'https://github.com/kortirso/kudos'
  spec.summary     = 'Achievements engine for Rails application'
  spec.description = 'Achievements engine for Rails application similar to World of Warcraft achievements system.'
  spec.license     = 'MIT'

  spec.required_ruby_version = '>= 2.7'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri'] = 'https://github.com/kortirso/kudos/blob/master/CHANGELOG.md'

  spec.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  spec.add_dependency 'rails', '> 6.0.0'

  # rubocop: disable Gemspec/DevelopmentDependencies
  spec.add_development_dependency 'bundler'
  # rubocop: enable Gemspec/DevelopmentDependencies
  spec.add_development_dependency 'pg', '> 1.0'
  spec.add_development_dependency 'puma', '~> 6.0'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rubocop', '~> 1.39'
  spec.add_development_dependency 'rubocop-performance', '~> 1.8'
  spec.add_development_dependency 'rubocop-rake', '~> 0.6'
  spec.add_development_dependency 'rubocop-rspec', '~> 2.0'
end
