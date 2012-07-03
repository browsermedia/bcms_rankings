# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "bcms_rankings/version"

Gem::Specification.new do |s|
  s.name = %q{bcms_rankings}
  s.version = BcmsRankings::VERSION

  s.authors = ["BrowserMedia"]
  s.description = %q{A Page ranking Module for BrowserCMS}
  s.summary = %q{A Page ranking Module for BrowserCMS}
  
  s.email = %q{github@browsermedia.com}
  s.extra_rdoc_files = ["README.markdown"]

  s.files = Dir["{app,config,db,lib}/**/*"]
  s.files += Dir["Gemfile", "LICENSE.txt", "COPYRIGHT.txt", "GPL.txt" ]

  s.add_dependency("browsercms", "< 3.6.0", ">= 3.5.0")
  s.has_rdoc = true
  s.homepage = %q{http://www.github.com/browsermedia/bcms_rankings}
  s.require_paths = ["lib"]


end
