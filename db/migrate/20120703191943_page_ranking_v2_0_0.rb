require 'cms/upgrades/v3_5_0'

class PageRankingV200 < ActiveRecord::Migration
  def change
      v3_5_0_apply_namespace_to_block("BcmsRankings", "PageRanking")
  end
end