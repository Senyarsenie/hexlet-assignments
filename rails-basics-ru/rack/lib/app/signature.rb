# frozen_string_literal: true

require 'digest'

class Signature
  def initialize(app)
    @app = app
  end

  def call(env)
    env["rack.hexdigest"] = Digest::SHA256.hexdigest('abc')
    @app.call(env)
  end
end
