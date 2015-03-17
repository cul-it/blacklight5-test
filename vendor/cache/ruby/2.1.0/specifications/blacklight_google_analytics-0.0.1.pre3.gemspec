# -*- encoding: utf-8 -*-
# stub: blacklight_google_analytics 0.0.1.pre3 ruby lib

Gem::Specification.new do |s|
  s.name = "blacklight_google_analytics"
  s.version = "0.0.1.pre3"

  s.required_rubygems_version = Gem::Requirement.new("> 1.3.1") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Jason Ronallo"]
  s.date = "2012-04-10"
  s.description = "Adds Google Analytics to Blacklight Rails application including event tracking."
  s.email = ["jronallo@gmail.com"]
  s.homepage = "https://github.com/jronallo/blacklight_google_analytics"
  s.rubygems_version = "2.4.5"
  s.summary = "Adds Google Analytics to Blacklight Rails application."

  s.installed_by_version = "2.4.5" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<sqlite3>, [">= 0"])
    else
      s.add_dependency(%q<sqlite3>, [">= 0"])
    end
  else
    s.add_dependency(%q<sqlite3>, [">= 0"])
  end
end
