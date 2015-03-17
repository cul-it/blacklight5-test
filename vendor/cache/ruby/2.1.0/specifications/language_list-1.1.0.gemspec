# -*- encoding: utf-8 -*-
# stub: language_list 1.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "language_list"
  s.version = "1.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Steve Smith"]
  s.date = "2015-03-10"
  s.description = "A list of languages based upon ISO-639-1 and ISO-639-3 with functions to retrieve only common languages."
  s.email = ["gems@dynedge.co.uk"]
  s.homepage = "https://github.com/scsmith/language_list"
  s.rubyforge_project = "language_list"
  s.rubygems_version = "2.4.5"
  s.summary = "A list of languages and methods to find and work with these languages."

  s.installed_by_version = "2.4.5" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<minitest>, ["> 5.0.0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
    else
      s.add_dependency(%q<minitest>, ["> 5.0.0"])
      s.add_dependency(%q<rake>, [">= 0"])
    end
  else
    s.add_dependency(%q<minitest>, ["> 5.0.0"])
    s.add_dependency(%q<rake>, [">= 0"])
  end
end
