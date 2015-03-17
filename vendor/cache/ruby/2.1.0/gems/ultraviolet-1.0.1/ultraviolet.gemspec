$LOAD_PATH.push File.expand_path("../lib", __FILE__)
require "uv/version"

Gem::Specification.new "ultraviolet", Uv::Version do |s|
  s.authors = ["Dizan Vasquez", "Spox", "Chris Hoffman", "Michael Grosser"]
  s.email = ["michael@grosser.it"]
  s.homepage = "https://github.com/grosser/ultraviolet"
  s.summary = "Ultraviolet syntax highlighting gem for Ruby18 and Ruby19"
  s.description = s.summary
  s.license = "MIT"

  s.files = `git ls-files`.split("\n")
  s.executables = ["theme2xhtmlrender", "theme2latexrender", "uv"]
  s.add_runtime_dependency "textpow", ">=1.3.0"
end
