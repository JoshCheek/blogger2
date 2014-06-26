require 'blogger'
require 'blogger/web_clients/rack'

module Blogger::TestHelper
  def client
    @blogger_client ||= begin
      # username, secret = 'test_username', 'test_secret'
      session = Rack::Test::Session.new(Rails.application)
      # session.basic_authorize username, secret
      client = Blogger::WebClients::Rack.new session
      Blogger::Client.new \
        web_client: client,
        base_url:   "" # no need for a base url in test env
    end
  end
end
