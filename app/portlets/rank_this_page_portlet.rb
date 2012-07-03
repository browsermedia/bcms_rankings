class RankThisPagePortlet < Cms::Portlet
    
  def render
    @page = @controller.instance_variable_get("@page")
    if @page
      @rankings = ranking().for_page(@page)
      @average_rank = average_ranking(@rankings)
      
      # For the form to create a new ranking
      @page_ranking = ranking().new(:page => @page)
    end
  end

  def average_ranking(rankings)
    return 0 unless rankings.size > 0
    total = 0.0
    rankings.each do |r|
      total = total + r.rank
    end
    (total/rankings.size).round(1)

  end
  
  private
  
  # Faux class like method for less typing
  def ranking()
    BcmsRankings::PageRanking
  end
end