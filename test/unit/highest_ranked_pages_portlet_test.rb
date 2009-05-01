require File.join(File.dirname(__FILE__), '/../test_helper')

class HighestRankedPagesPortletTest < ActiveSupport::TestCase

  def setup

  end

  def teardown

  end


  test "Portlet should find the highest ranked pages, in order of highest average ranking" do
    page_b = Page.create!(:name=>"B", :path=>"/b")
    page_c = Page.create!(:name=>"C", :path=>"/c")
    page_a = Page.create!(:name=>"A", :path=>"/a")


    PageRanking.rank(page_a, 1)
    PageRanking.rank(page_a, 1)
    PageRanking.rank(page_a, 1)
    PageRanking.rank(page_b, 2)
    PageRanking.rank(page_b, 1)
    PageRanking.rank(page_c, 1)

    portlet = HighestRankedPagesPortlet.new
    portlet.number_to_show = 2
    # This should be unnecessary, but Portlets can't internally reference their own properties atm.
    portlet.instance_variable_set(:@portlet, portlet)

    portlet.render

    pages = portlet.instance_variable_get(:@pages)
    assert_equal [page_b, page_a], pages
    assert_equal "2", pages[0].rankings_count, "should include the total # of rankings"
    assert_equal "3", pages[1].rankings_count
    assert_equal 1.5, pages[0].avg_rank.to_f, "should include the average rank"
    assert_equal 1, pages[1].avg_rank.to_f
  end
end