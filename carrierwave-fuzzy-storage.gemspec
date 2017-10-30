$LOAD_PATH.push File.expand_path('lib', __dir__)

require 'carrierwave/fuzzy_storage/version'

Gem::Specification.new do |s|
  s.name        = 'carrierwave-fuzzy-storage'
  s.version     = CarrierWave::FuzzyStorage::VERSION
  s.authors     = ['Fjord Software']
  s.email       = ['support@fjordsoftware.eu']
  s.homepage    = 'https://github.com/FjordSoftware/carrierwave-fuzzy-storage'
  s.summary     = 'Fuzzy storage support for carrierwave'
  s.license     = 'BSD-2-Clause'

  s.files = Dir['lib/**/*']
  # s.test_files = Dir['spec/**/*']

  s.required_ruby_version = '>= 2.2.2'

  s.add_dependency 'carrierwave', '>= 0.10.0'
end
