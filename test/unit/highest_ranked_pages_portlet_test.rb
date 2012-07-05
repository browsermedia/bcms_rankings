require File.join(File.dirname(__FILE__), '/../test_helper')

module BcmsRankings
  class HighestRankedPagesPortletTest < ActiveSupport::TestCase

    def setup

    end

    def teardown

    end


    test "Portlet should find the highest ranked pages, in order of highest average ranking" do
      page_b = create(:page, :name=>"B", :path=>"/b")
      page_c = create(:page, :name=>"C", :path=>"/c")
      page_a = create(:page, :name=>"A", :path=>"/a")


      PageRanking.rank(page_a, 1)
      PageRanking.rank(page_a, 1)
      PageRanking.rank(page_a, 2)
      PageRanking.rank(page_b, 3)
      PageRanking.rank(page_b, 1)
      PageRanking.rank(page_c, 1)

      portlet = HighestRankedPagesPortlet.new
      portlet.number_to_show = 2
      # This should be unnecessary, but Portlets can't internally reference their own properties atm.
      portlet.instance_variable_set(:@portlet, portlet)

      portlet.render

      pages = portlet.instance_variable_get(:@pages)
      assert_equal [page_b, page_a], pages
      assert_equal 2, pages[0].rankings_count, "should include the total # of rankings"
      assert_equal 3, pages[1].rankings_count
      assert_equal 2, pages[0].avg_rank.to_f, "should include the average rank"
      assert_equal 1.33, pages[1].avg_rank.to_f.round(2)
    end
    
    private

    # Faux FactoryGirl syntax
    def create(type, options)
      Cms::Page.create!(options)
    end
  end
  
  
end