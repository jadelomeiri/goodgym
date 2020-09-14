require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: { crypted_password: @user.crypted_password, email: @user.email, name: @user.name, salt: @user.salt } }
    end

    assert_redirected_to user_url(User.last)
  end
end
