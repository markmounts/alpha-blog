require 'test_helper'

class CreateArticleTest < ActionDispatch::IntegrationTest

  def setup
    @user = User.create(username: "john", email: "john@email.com", password: "password", admin: false)
  end

  test "Create new article" do
    sign_in_as(@user, "password")
    get new_article_path
    assert_template 'articles/new'
    assert_difference 'Article.count', 1 do
      post_via_redirect articles_path, article: {title: "testing new article", description: "this is a test"}
    end
    assert_template 'articles/show'
    assert_match @user.username, response.body
    assert_match "testing new article", response.body
  end

end