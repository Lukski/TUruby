require 'test_helper'

class SearchableControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get searchable_search_url
    assert_response :success
  end

end
