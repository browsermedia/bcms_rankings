class PageRankingsController < ApplicationController

  def create
    @page_ranking = PageRanking.new(params[:page_ranking])
    @page_ranking.ip = request.remote_ip
    if !@page_ranking.save
      flash[:notice] = "New Ranking was created"
    end
    redirect_to @page_ranking.page.path
  end
end
