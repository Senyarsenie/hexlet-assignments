# frozen_string_literal: true

require 'forwardable'
require 'uri'

class Url
  extend Forwardable
  include Comparable

  attr_reader :url, :scheme, :host, :query, :port

  def_delegators :@uri, :host, :scheme, :port

  alias query_params query

  def initialize(url)
    @uri = URI(url)
    @url = url
    @query = parse_query(url)
  end

  def <=>(other)
    { scheme:, port:, host:, query: } <=> { scheme: other.scheme, port: other.port, host: other.host, query: other.query }
  end

  def query_param(key, value = nil)
    query_value = @query[key]

    if query_value || value.nil?
      return query_value
    elsif query_value.nil? && value
      value
    end
  end

  private

  def parse_query(url)
    return {} unless url.include? '?'

    query_from_url = url.split('?').last
    params = query_from_url.split('&')

    params.map do |str|
      key, value = str.split('=')
      [key.to_sym, value]
    end.to_h
  end
end
