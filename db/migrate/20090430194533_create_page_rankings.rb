class CreatePageRankings < ActiveRecord::Migration
  def change
    create_versioned_table :page_rankings do |t|
      t.belongs_to :page
      t.string :name
      t.integer :rank 
      t.string :ip 
    end
  end
end
