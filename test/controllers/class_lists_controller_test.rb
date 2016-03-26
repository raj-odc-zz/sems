require 'test_helper'

class ClassListsControllerTest < ActionDispatch::IntegrationTest
  test "should get update_class_list" do
    get class_lists_update_class_list_url
    assert_response :success
  end

end
