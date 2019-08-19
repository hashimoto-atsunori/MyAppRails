# -*- encoding: utf-8 -*-
# stub: devise 1.5.4 ruby lib

Gem::Specification.new do |s|
  s.name = "devise".freeze
  s.version = "1.5.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Jos\u00E9 Valim".freeze, "Carlos Ant\u00F4nio".freeze]
  s.date = "2013-01-26"
  s.description = "Flexible authentication solution for Rails with Warden".freeze
  s.email = "contact@plataformatec.com.br".freeze
  s.homepage = "http://github.com/plataformatec/devise".freeze
  s.rubygems_version = "3.0.3".freeze
  s.summary = "Flexible authentication solution for Rails with Warden".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<warden>.freeze, ["~> 1.1"])
      s.add_runtime_dependency(%q<orm_adapter>.freeze, ["~> 0.0.3"])
      s.add_runtime_dependency(%q<bcrypt-ruby>.freeze, ["~> 3.0"])
    else
      s.add_dependency(%q<warden>.freeze, ["~> 1.1"])
      s.add_dependency(%q<orm_adapter>.freeze, ["~> 0.0.3"])
      s.add_dependency(%q<bcrypt-ruby>.freeze, ["~> 3.0"])
    end
  else
    s.add_dependency(%q<warden>.freeze, ["~> 1.1"])
    s.add_dependency(%q<orm_adapter>.freeze, ["~> 0.0.3"])
    s.add_dependency(%q<bcrypt-ruby>.freeze, ["~> 3.0"])
  end
end
