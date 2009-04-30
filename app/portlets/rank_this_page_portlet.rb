class RankThisPagePortlet < Portlet
    
  def render
    @page = @controller.instance_variable_get("@page")
    if @page
      @rankings = PageRanking.for_page(@page)
      @average_rank = average_ranking(@rankings)
      
      # For the form to create a new ranking
      @page_ranking = PageRanking.new(:page => @page)
    end
  end

  def average_ranking(rankings)
    total = 0.0
    rankings.each do |r|
      total = total + r.rank
    end
    (total/rankings.size).round_with_precision(1)

  end
end