class PageRanking < ActiveRecord::Base
  acts_as_content_block
  
  belongs_to :page

  validates_presence_of :page_id

  named_scope :for_page, lambda{|p| {:conditions => ["page_rankings.page_id = ?", p.id]}}


  def self.rank(page, rank)
    PageRanking.create!(:page=>page, :rank=>rank)    
  end
end
