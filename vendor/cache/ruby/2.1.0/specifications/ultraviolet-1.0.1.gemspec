# -*- encoding: utf-8 -*-
# stub: ultraviolet 1.0.1 ruby lib

Gem::Specification.new do |s|
  s.name = "ultraviolet"
  s.version = "1.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Dizan Vasquez", "Spox", "Chris Hoffman", "Michael Grosser"]
  s.date = "2013-05-02"
  s.description = "Ultraviolet syntax highlighting gem for Ruby18 and Ruby19"
  s.email = ["michael@grosser.it"]
  s.executables = ["theme2xhtmlrender", "theme2latexrender", "uv"]
  s.files = ["bin/theme2latexrender", "bin/theme2xhtmlrender", "bin/uv"]
  s.homepage = "https://github.com/grosser/ultraviolet"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.4.5"
  s.summary = "Ultraviolet syntax highlighting gem for Ruby18 and Ruby19"

  s.installed_by_version = "2.4.5" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<textpow>, [">= 1.3.0"])
    else
      s.add_dependency(%q<textpow>, [">= 1.3.0"])
    end
  else
    s.add_dependency(%q<textpow>, [">= 1.3.0"])
  end
end
