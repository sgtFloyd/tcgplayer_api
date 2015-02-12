require './lib/tcgplayer_api'

Gem::Specification.new do |s|
  s.name    = "tcgplayer_api"
  s.version = TCGplayerAPI::VERSION
  s.summary = "Ruby interface for TCGplayer's pricing API"
  s.license = "MIT"

  s.authors     = ["Gabe Smith"]
  s.email       = ["sgt.floydpepper@gmail.com"]
  s.date        = Time.now.strftime "%Y-%m-%d"
  s.homepage    = "https://github.com/sgtFloyd/tcgplayer_api"
  s.description = "Ruby interface for TCGplayer's pricing API"

  s.require_paths = ["lib"]
  s.files         = Dir['lib/**/*.rb']

  s.add_dependency "activesupport"
end
