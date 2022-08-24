# frozen_string_literal: true

class KudagoAPI
  DEFAULT_LOCATION = 'msk'
  HOST = 'https://kudago.com'
  API_PREFIX = 'public-api'
  API_VERSION = 'v1.4'
  PAGE_SIZE = 12
  EXPAND_FIELDS = %w[images places location dates].freeze

  attr_reader :conn

  def initialize
    @conn = Faraday.new(
      url: HOST,
      headers: { 'Content-Type' => 'application/json' }
    )
  end

  def fetch_events
    fields = %w[title description place location dates images]
    url = build_url('events', fields)
    response = get(url).body
    JSON.parse(response)['results']
  end

  private

  def build_url(path, fields)
    expand = fields - EXPAND_FIELDS
    url = <<~URL.squish
      #{API_PREFIX}/#{API_VERSION}/#{path}/
      ?location=#{DEFAULT_LOCATION}
      &expand=#{expand.join(',')}
      &fields=#{fields.join(',')}
      &page_size=#{PAGE_SIZE}
      &actual_since=#{1.month.ago.to_i}
      &actual_till=#{1.month.since.to_i}
    URL

    url.gsub(/\s+/, '')
  end

  def get(url)
    conn.send(:get, url)
  end
end
