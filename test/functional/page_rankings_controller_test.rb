require File.join(File.dirname(__FILE__), '/../test_helper')

module BcmsRankings
  class PageRankingsControllerTest < ActionController::TestCase

    tests ::PageRankingsController
    
    def setup
      
    end
  
    test "Should create a ranking with a name" do
      page = Cms::Page.create!(:name => "Rank Me", :path=>"/path")
      assert_equal "0.0.0.0", @request.remote_ip, "Verifies what the expected IP is from the Mock request"

      post :create, :page_ranking => {:rank => 4, :page_id => page.id}, :use_route => :main_app

      ranks = PageRanking.all

      
      assert_equal 1, ranks.size
      assert_equal page, ranks[0].page
      assert_equal 4, ranks[0].rank
      assert_equal "0.0.0.0", ranks[0].ip
      assert_equal "Page 'Rank Me' ranked as 4", ranks[0].name
    end
  end
end
