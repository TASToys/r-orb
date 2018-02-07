require 'test_helper'

class NowplayingControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get nowplaying_index_url
    assert_response :success
  end

end
