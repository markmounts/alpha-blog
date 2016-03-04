require 'test_helper'

class CreateUserTest < ActionDispatch::IntegrationTest

  def setup
    @user = User.create(username: "Joe Smith", email: "joe@email.com", password: "password", admin: false)
    @new_user = User.new(username: "Evan Smith", email: "evan@email.com")
  end

  test "Create new user" do
    get signup_path
    assert_template 'users/new'
    assert_difference 'User.count', 1 do
      post_via_redirect users_path, user: {username: @new_user.username, email: @new_user.email, password: "password", admin: false}
    end
    @user2 = User.last
    assert_template 'users/show'
    assert_match @user2.username, @new_user.username
    assert_match @user2.email, @new_user.email
    assert_match "Welcome to " + @user2.username + "\'s page", response.body
  end

end