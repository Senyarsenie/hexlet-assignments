# frozen_string_literal: true

require 'rack'

class Router
  def call(env)
    request = Rack::Request.new(env)
    case request.path
    when '/'
      [200, {}, ['Hello, World!', 'dffd6021bb2bd5b0af676290809ec3a53191dd81c7f70a4b28688a362182986f']]
    when '/about'
      [200, {}, ['About page', 'c10b56512c9dc446d5a5624e9c044a68eddbc9239a3994554943805a8bc38ba7']]
    else
      [404, {}, ['404 Not Found']]
    end
  end
end
