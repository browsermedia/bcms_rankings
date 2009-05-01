class HighestRankedPagesPortlet < Portlet
    
  def render
    @pages =
            Page.find(:all,
              :select => 'pages.*, COUNT(page_rankings.id) AS rankings_count, AVG(page_rankings.rank) as avg_rank',
              :joins  => 'INNER JOIN page_rankings ON page_rankings.page_id = pages.id',
              :group  => 'pages.id',
              :limit => @portlet.number_to_show,
              :order => "avg_rank desc")
  end

end