Gem::Specification.new do |s|
  s.name          = 'studio_game_paclough'
  s.version       = '1.0.0'
  s.author        = 'Paul Clough'
  s.email         = 'paclough@github'
  s.homepage      = 'https://github.com/paclough/studio_game'
  s.summary       = 'Studio Game, the example project from Pragmatic Studio Ruby Programming'
  s.description   = File.read( File.join( File.dirname( __FILE__ ), 'README' ) )

  s.files         = Dir[ "{bin,lib,spec}/**/*"] + %w(LICENSE README)
  s.test_files    = Dir[ "spec/**/*" ]
  s.executables   = [ 'studio_game' ]

  s.required_ruby_version       = '>=1.9'
  s.add_development_dependency 'rspec'
end