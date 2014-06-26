module Blogger
  # so all our errors have a common superclass
  BloggerError = Class.new(::StandardError)

  class ResourceNotFound < BloggerError
    def initialize(klass, url)
      super "Could not find a #{klass.name} at #{url.inspect}"
    end
  end

  class ClientIsUnauthorized < BloggerError
    def initialize
      super "Blogger client is not authorized to talk to back-end repository. "\
            "Make sure your username and password are correct, and exist in the remote_clients table in asquared. "\
            "The credentials probably come from config/secrets.yml"
    end
  end
end
