require 'test_helper'

class LibraryControllerTest < ActionDispatch::IntegrationTest
  test "should get user_id:integer" do
    get library_user_id:integer_url
    assert_response :success
  end

end
