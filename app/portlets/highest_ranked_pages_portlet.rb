class HighestRankedPagesPortlet < Cms::Portlet
    
  def render
    @pages =
            Cms::Page.find(:all,
              :select => "#{Cms::Page.table_name}.*, COUNT(#{BcmsRankings::PageRanking.table_name}.id) AS rankings_count, AVG(#{BcmsRankings::PageRanking.table_name}.rank) as avg_rank",
              :joins  => "INNER JOIN #{BcmsRankings::PageRanking.table_name} ON #{BcmsRankings::PageRanking.table_name}.page_id = #{Cms::Page.table_name}.id",
              :group  => "#{Cms::Page.table_name}.id",
              :limit => @portlet.number_to_show,
              :order => "avg_rank desc")
  end

end