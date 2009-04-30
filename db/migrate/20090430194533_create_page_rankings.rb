class CreatePageRankings < ActiveRecord::Migration
  def self.up
    create_versioned_table :page_rankings do |t|
      t.belongs_to :page
      t.string :name
      t.integer :rank 
      t.string :ip 
    end
    
    
    ContentType.create!(:name => "PageRanking", :group_name => "Page Ranking")
  end

  def self.down
    ContentType.delete_all(['name = ?', 'PageRanking'])
    drop_table :page_ranking_versions
    drop_table :page_rankings
  end
end
