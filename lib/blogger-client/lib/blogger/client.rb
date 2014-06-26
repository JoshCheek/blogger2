require 'json'
require 'cgi'
require 'date'

module Blogger
  class Client
    # e.g. 2014-04-18 21:14:16 UTC
    # comes from https://github.com/rails/rails/blob/5f72fc6af8ad19df2b4e4f442b9ab17dd6846f46/activesupport/lib/active_support/time_with_zone.rb#L196
    TIME_FORMAT         = "%Y/%m/%d %H:%M:%S %Z".freeze

    attr_accessor :web_client, :base_url

    def initialize(attributes)
      self.web_client = attributes.fetch :web_client
      self.base_url   = attributes.fetch :base_url
    end

    def all
      url          = url_for "/articles.json"
      result       = web_client.get url # note that you'll really need to check result.status here to make sure it's 200
      raw_articles = JSON.parse(result.body)
      raw_articles.map do |article_attributes|
        Article.new(normalize_attributes(article_attributes))
      end
    end

    def normalize_attributes(raw_article)
      raw_article.merge({
        'created_at' => DateTime.strptime(raw_article.fetch('created_at'), TIME_FORMAT),
        'updated_at' => DateTime.strptime(raw_article.fetch('updated_at'), TIME_FORMAT),
      })
    end

    def url_for(path, query_params={})
      base_url + path + to_query_string(query_params)
    end

    # there's only one test on this, IDK why it's not just a method in CGI
    # implementation is half-stolen from Rails, and half just "well this makes sense" :/
    def to_query_string(params)
      return '' if params.empty?
      '?' << params.map { |key, value| "#{CGI.escape key.to_s}=#{CGI.escape value.to_s}" }.join('&')
    end
  end
end
