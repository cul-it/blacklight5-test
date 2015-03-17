# -*- encoding: utf-8 -*-
# stub: summon 2.0.5 ruby lib

Gem::Specification.new do |s|
  s.name = "summon"
  s.version = "2.0.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Charles Lowell", "Dani\u{eb}l van de Burgt"]
  s.date = "2012-03-30"
  s.description = "Ruby language bindings for Serials Solutions Summon Unified Discovery Service"
  s.email = ["cowboyd@thefrontside.net", "daniel.vandeburgt@serialssolutions.com"]
  s.executables = ["summon", "summonh"]
  s.files = ["bin/summon", "bin/summonh"]
  s.homepage = "http://github.com/summon/summon.rb"
  s.post_install_message = "\nFor comprehensive documentation on Summon API options and usage visit:\n\nhttp://api.summon.serialssolutions.com\n\n"
  s.rubygems_version = "2.4.5"
  s.summary = "Ruby language bindings for Serials Solutions Summon Unified Discovery Service"

  s.installed_by_version = "2.4.5" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<json>, [">= 0"])
      s.add_development_dependency(%q<rspec>, ["~> 2.0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
    else
      s.add_dependency(%q<json>, [">= 0"])
      s.add_dependency(%q<rspec>, ["~> 2.0"])
      s.add_dependency(%q<rake>, [">= 0"])
    end
  else
    s.add_dependency(%q<json>, [">= 0"])
    s.add_dependency(%q<rspec>, ["~> 2.0"])
    s.add_dependency(%q<rake>, [">= 0"])
  end
end
