require 'test_helper'

class ArticleCategoryTest < ActiveSupport::TestCase

  def setup
    @article_category = ArticleCategory.new(article_id: 1, category_id: 1)
  end

  test "article id and category id should be valid" do
    assert @article_category.valid?
  end

  test "both article id and category id should be present" do

  end

end