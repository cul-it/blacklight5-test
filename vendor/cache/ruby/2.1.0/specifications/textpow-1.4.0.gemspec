# -*- encoding: utf-8 -*-
# stub: textpow 1.4.0 ruby lib

Gem::Specification.new do |s|
  s.name = "textpow"
  s.version = "1.4.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Dizan Vasquez", "Spox", "Chris Hoffman", "Michael Grosser"]
  s.date = "2015-01-12"
  s.description = "A library for parsing TextMate bundles"
  s.email = ["michael@grosser.it"]
  s.executables = ["plist2yaml", "plist2syntax"]
  s.files = ["bin/plist2syntax", "bin/plist2yaml"]
  s.homepage = "https://github.com/grosser/textpow"
  s.licenses = ["MIT"]
  s.rdoc_options = ["--main", "README.rdoc"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.3")
  s.rubygems_version = "2.4.5"
  s.summary = "A library for parsing TextMate bundles"

  s.installed_by_version = "2.4.5" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<plist>, [">= 3.0.1"])
    else
      s.add_dependency(%q<plist>, [">= 3.0.1"])
    end
  else
    s.add_dependency(%q<plist>, [">= 3.0.1"])
  end
end
