# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{bcms_rankings}
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["BrowserMedia"]
  s.date = %q{2009-07-02}
  s.description = %q{A Page ranking Module for BrowserCMS}
  s.email = %q{github@browsermedia.com}
  s.extra_rdoc_files = [
    "LICENSE.txt",
     "README.markdown"
  ]
  s.files = [
    "app/controllers/application_controller.rb",
     "app/controllers/cms/page_rankings_controller.rb",
     "app/controllers/page_rankings_controller.rb",
     "app/helpers/application_helper.rb",
     "app/models/page_ranking.rb",
     "app/portlets/highest_ranked_pages_portlet.rb",
     "app/portlets/rank_this_page_portlet.rb",
     "app/views/cms/page_rankings/_form.html.erb",
     "app/views/cms/page_rankings/render.html.erb",
     "app/views/portlets/highest_ranked_pages/_form.html.erb",
     "app/views/portlets/highest_ranked_pages/render.html.erb",
     "app/views/portlets/rank_this_page/_form.html.erb",
     "app/views/portlets/rank_this_page/render.html.erb",
     "db/migrate/20090430194533_create_page_rankings.rb",
     "lib/bcms_rankings.rb",
     "lib/bcms_rankings/routes.rb",
     "rails/init.rb"
  ]
  s.has_rdoc = true
  s.homepage = %q{http://browsercms.org}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{browsercms}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{A Page ranking Module for BrowserCMS}
  s.test_files = [
    "test/functional/page_rankings_controller_test.rb",
     "test/performance/browsing_test.rb",
     "test/test_helper.rb",
     "test/unit/highest_ranked_pages_portlet_test.rb",
     "test/unit/page_ranking_test.rb",
     "test/unit/rank_this_page_portlet_test.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
