require 'test_helper'

class ProfilesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get profiles_new_url
    assert_response :success
  end

  test "should get edit" do
    get profiles_edit_url
    assert_response :success
  end

  test "should get _form" do
    get profiles__form_url
    assert_response :success
  end

end
