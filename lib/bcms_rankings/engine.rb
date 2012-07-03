require 'browsercms'
module BcmsRankings
  class Engine < ::Rails::Engine
    isolate_namespace BcmsRankings
		include Cms::Module
		
    initializer 'bcms_rankings.route_extensions', :after => 'action_dispatch.prepare_dispatcher' do |app|
      ActionDispatch::Routing::Mapper.send :include, BcmsRankings::RouteExtensions
    end
  end
end
