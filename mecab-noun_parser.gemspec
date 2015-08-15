$:.unshift File.expand_path('../lib', __FILE__)

require 'mecab/noun_parser/version'

Gem::Specification.new do |s|
  s.name        = 'mecab-noun_parser'
  s.version     = MeCab::NounParser::VERSION
  s.authors     = 'kami'
  s.email       = 'kami30k@gmail.com'

  s.summary     = ''
  s.description = ''
  s.homepage    = 'https://github.com/kami30k/mecab-noun_parser'

  s.files       = `git ls-files -z`.split("\x0")

  s.add_development_dependency 'bundler'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
end
