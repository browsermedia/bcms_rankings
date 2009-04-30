require File.join(File.dirname(__FILE__), '/../test_helper')

class RankThisPagePortletTest < ActiveSupport::TestCase

  def setup

  end

  def teardown

  end


  test "Calculate average rankings" do
    portlet = RankThisPagePortlet.new

    assert_equal 3, portlet.average_ranking([PageRanking.new(:rank => 2), PageRanking.new(:rank=>4)])
    assert_equal 2.5, portlet.average_ranking([PageRanking.new(:rank=>2), PageRanking.new(:rank=>3)])
    assert_equal 2.7, portlet.average_ranking([PageRanking.new(:rank=>2), PageRanking.new(:rank=>3), PageRanking.new(:rank=>3)])
  end


  # Tests the fields made available to template. Since template is copied on creation, further versions should attempt
  #   to be backwards compatible so as to not break previously created portlets.
  test "Portlet should load all rankings, average them, and make all attributes avaiable to the template" do
    page = Page.create!(:name=>"Ranked Page", :path => "/ranked")
    rankings = [
            PageRanking.create!(:page=>page, :rank=>3),
            PageRanking.create!(:page=>page, :rank=>2)]
    portlet = RankThisPagePortlet.new

    class MockController
      def initialize(page)
        @page = page
      end
    end
    portlet.instance_variable_set(:@controller, MockController.new(page))
    
    portlet.render

    assert_equal page, portlet.instance_variable_get(:@page)
    assert_equal 2.5, portlet.instance_variable_get(:@average_rank)
    assert_not_nil  portlet.instance_variable_get(:@page_ranking), "Should create an empoty PageRanking for the form."
    assert_equal rankings, portlet.instance_variable_get(:@rankings), "Should load all the rankings for the form." 
  end
end