# frozen_string_literal: true
require 'dry/monads'

module Sable
  class OneUrlScraper
    include ::Dry::Monads[:result, :do]
    include ::Sable::Import['proxies', 'headers', 'http_client']

    def call(url, block)
      proxy   = yield proxies.()
      headers = yield headers.()
      html    = yield http_client.request(url, proxy, headers)

      yield parser.parse(html, block)
    end
  end
end
