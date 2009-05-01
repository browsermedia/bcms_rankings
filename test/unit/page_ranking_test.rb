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

  test "PageRanking.rank should create a rank for a given page" do
    page = Page.create!(:name => "Name", :path=>"/path")

    rank = PageRanking.rank(page, 1)

    assert(PageRanking === rank, "Should create a PageRanking object")
    assert_equal page, rank.page
    assert_equal 1, rank.rank

  end
end