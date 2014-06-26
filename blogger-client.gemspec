require File.expand_path('../lib/blogger-client/lib/blogger/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = "blogger-client"
  s.version     = Blogger::VERSION
  s.authors     = ["Josh Cheek"]
  s.email       = ["josh@jumpstartlab.com"]
  s.homepage    = "http://example.com"
  s.summary     = %q{Client to consume Blogger}
  s.description = %q{Client to consume Blogger}

  s.files = %w[
    blogger-client.gemspec
    lib/blogger-client
    lib/blogger-client/lib
    lib/blogger-client/lib/blogger
    lib/blogger-client/lib/blogger/article.rb
    lib/blogger-client/lib/blogger/client.rb
    lib/blogger-client/lib/blogger/errors.rb
    lib/blogger-client/lib/blogger/response.rb
    lib/blogger-client/lib/blogger/version.rb
    lib/blogger-client/lib/blogger/web_clients
    lib/blogger-client/lib/blogger/web_clients/net_http.rb
    lib/blogger-client/lib/blogger/web_clients/rack.rb
    lib/blogger-client/lib/blogger.rb
    lib/blogger-client/README.md
  ]

  s.test_files    = []
  s.executables   = []
  s.require_paths = ["lib/blogger-client/lib"]
end

