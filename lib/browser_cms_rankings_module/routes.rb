module Cms::Routes
  def routes_for_browser_cms_rankings_module
    page_rankings "/page_rankings",
      :controller => "page_rankings",
      :action => "create",
      :conditions => {:method => :post}

    namespace(:cms) do |cms|
      cms.content_blocks :page_rankings
    end  
  end
end
