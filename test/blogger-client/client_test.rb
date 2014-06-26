require_relative '../test_helper'
require_relative 'test_helper'

class ClientTest < ::MiniTest::Test
  include Blogger::TestHelper

  def test_retrieves_articles
    Article.delete_all # in the end, you'll use a database cleaner instead of doing this manually

    app_articles = Article.create([
      {title: 'Test Title1', body: 'Test Body1'},
      {title: 'Test Title2', body: 'Test Body2'},
    ])

    client_articles = client.all
    assert_equal 2, client_articles.size

    # NOTE: ALSO NEED TO TEST CREATED AT, UPDATED AT, ID

    assert_equal app_articles.first.title, client_articles.first.title
    assert_equal app_articles.first.body,  client_articles.first.body

    assert_equal app_articles.last.title, client_articles.last.title
    assert_equal app_articles.last.body,  client_articles.last.body
  end
end
