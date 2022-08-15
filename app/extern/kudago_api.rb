# frozen_string_literal: true

class KudagoAPI
  DEFAULT_LOCATION = 'msk'
  HOST = 'https://kudago.com'
  API_PREFIX = 'public-api'
  API_VERSION = 'v1.4'

  attr_reader :conn

  def initialize
    @conn = Faraday.new(
      url: HOST,
      headers: { 'Content-Type' => 'application/json' }
    )
  end

  def request(verb, path)
    conn.send(verb, "#{API_PREFIX}/#{API_VERSION}/#{path}")
  end

  def fetch_events
    request(:get, "events?location=#{DEFAULT_LOCATION}").body
  end
end
