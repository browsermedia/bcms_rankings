module Cms::Routes
  def routes_for_browser_cms_rankings_module
    namespace(:cms) do |cms|
      #cms.content_blocks :rankings
    end  
  end
end
