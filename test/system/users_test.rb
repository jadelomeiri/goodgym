require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
  end

  test "creating a User" do
    visit root_url
    click_on "Sign up"

    fill_in "Email", with: @user.email
    fill_in "Name", with: @user.name
    fill_in "Password", with: @user.crypted_password
    fill_in "Password confirmation", with: @user.crypted_password
    click_on "Get started"

    assert_text "User was successfully created"
  end
end
