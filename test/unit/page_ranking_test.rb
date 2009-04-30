require File.join(File.dirname(__FILE__), '/../test_helper')

class PageRankingTest < ActiveSupport::TestCase

  def setup

  end

  def teardown

  end


  test "Page ranking can be found per page" do
    page = Page.create!(:name=>"Ranked Page", :path => "/ranked")
    rank = PageRanking.create!(:name=>"Testing", :page=>page)

    list = PageRanking.for_page(page)
    assert_equal [rank], list, "Should find all rankings for a given page."    

  end
end