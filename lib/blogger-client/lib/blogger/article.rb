module Blogger
  class Article
    attr_reader :id,
                :title,
                :body,
                :created_at,
                :updated_at

    def initialize(attributes)
      attributes.each { |name, value| instance_variable_set "@#{name}", value }
    end
  end
end
