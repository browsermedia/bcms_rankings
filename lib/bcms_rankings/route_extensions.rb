module BcmsRankings::RouteExtensions
  def mount_bcms_rankings
    mount BcmsRankings::Engine => "/bcms_rankings"
    post '/page_rankings' => 'page_rankings#create', :as=>'page_rankings'
  end
  
  alias :routes_for_bcms_rankings :mount_bcms_rankings
  
end
