# -*- encoding: utf-8 -*-
# stub: bento_search 1.2.2 ruby lib

Gem::Specification.new do |s|
  s.name = "bento_search"
  s.version = "1.2.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Jonathan Rochkind"]
  s.date = "2014-09-30"
  s.homepage = "http://github.com/jrochkind/bento_search"
  s.rubygems_version = "2.4.5"
  s.summary = "An abstraction/normalization layer for querying and displaying results for external search engines, in Ruby on Rails."

  s.installed_by_version = "2.4.5" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, ["< 5", ">= 3.2.3"])
      s.add_runtime_dependency(%q<confstruct>, ["< 1.0", ">= 0.2.3"])
      s.add_runtime_dependency(%q<httpclient>, ["< 3.0.0", ">= 2.2.5"])
      s.add_runtime_dependency(%q<multi_json>, ["< 2.0", ">= 1.0.4"])
      s.add_runtime_dependency(%q<nokogiri>, [">= 0"])
      s.add_runtime_dependency(%q<openurl>, ["< 1.1", ">= 0.3.1"])
      s.add_runtime_dependency(%q<summon>, [">= 0"])
      s.add_runtime_dependency(%q<language_list>, ["~> 1.0"])
      s.add_runtime_dependency(%q<htmlentities>, [">= 0"])
      s.add_development_dependency(%q<vcr>, ["~> 2.4"])
      s.add_development_dependency(%q<webmock>, ["~> 1.11.0"])
      s.add_development_dependency(%q<celluloid>, [">= 0"])
    else
      s.add_dependency(%q<rails>, ["< 5", ">= 3.2.3"])
      s.add_dependency(%q<confstruct>, ["< 1.0", ">= 0.2.3"])
      s.add_dependency(%q<httpclient>, ["< 3.0.0", ">= 2.2.5"])
      s.add_dependency(%q<multi_json>, ["< 2.0", ">= 1.0.4"])
      s.add_dependency(%q<nokogiri>, [">= 0"])
      s.add_dependency(%q<openurl>, ["< 1.1", ">= 0.3.1"])
      s.add_dependency(%q<summon>, [">= 0"])
      s.add_dependency(%q<language_list>, ["~> 1.0"])
      s.add_dependency(%q<htmlentities>, [">= 0"])
      s.add_dependency(%q<vcr>, ["~> 2.4"])
      s.add_dependency(%q<webmock>, ["~> 1.11.0"])
      s.add_dependency(%q<celluloid>, [">= 0"])
    end
  else
    s.add_dependency(%q<rails>, ["< 5", ">= 3.2.3"])
    s.add_dependency(%q<confstruct>, ["< 1.0", ">= 0.2.3"])
    s.add_dependency(%q<httpclient>, ["< 3.0.0", ">= 2.2.5"])
    s.add_dependency(%q<multi_json>, ["< 2.0", ">= 1.0.4"])
    s.add_dependency(%q<nokogiri>, [">= 0"])
    s.add_dependency(%q<openurl>, ["< 1.1", ">= 0.3.1"])
    s.add_dependency(%q<summon>, [">= 0"])
    s.add_dependency(%q<language_list>, ["~> 1.0"])
    s.add_dependency(%q<htmlentities>, [">= 0"])
    s.add_dependency(%q<vcr>, ["~> 2.4"])
    s.add_dependency(%q<webmock>, ["~> 1.11.0"])
    s.add_dependency(%q<celluloid>, [">= 0"])
  end
end
