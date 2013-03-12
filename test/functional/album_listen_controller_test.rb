require 'test_helper'

class AlbumListenControllerTest < ActionController::TestCase
  test "should get listen" do
    get :listen
    assert_response :success
  end

  test "should get unlisten" do
    get :unlisten
    assert_response :success
  end

end
