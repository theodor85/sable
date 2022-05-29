# frozen_string_literal: true

require_relative "sable/version"

require 'dry/monads'
require 'dry/container'
require 'dry/auto_inject'

module Sable
  container = Dry::Container.new

  container.register(:proxies) do
    require 'sable/proxies'
    ::Sable::Proxies.new
  end

  container.register(:one_url_scraper) do
    require 'sable/one_url_scraper'
    ::Sable::OneUrlScraper.new
  end



  Import = Dry::AutoInject(container)

  class Scraper
    include ::Dry::Monads[:result, :do]
    include Import['one_url_scraper']

    def scrap(url_list, &block)
      threads = url_list.map do |url|
        Thread.new do
          yield one_url_scraper.(url, block)
        end
      end
    
      result = threads.map do |thread|
        thread.value
      end
    
      return result
    end
  end
end
