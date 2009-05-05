module Cms::Routes
  def routes_for_bcms_rankings
    page_rankings "/page_rankings",
      :controller => "page_rankings",
      :action => "create",
      :conditions => {:method => :post}

    namespace(:cms) do |cms|
      cms.content_blocks :page_rankings
    end  
  end
end
