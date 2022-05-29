# frozen_string_literal: true
require 'sable/one_url_scraper'
require 'sable/proxies'
require 'sable/headers'
require 'sable/http_client'


RSpec.describe Sable::OneUrlScraper do
  let(:url) { 'https://smart-lab.ru/q/YNDX/f/y/MSFO/' }
  let(:data) do
    {
      source_url: 'https://smart-lab.ru/q/YNDX/f/y/MSFO/',
      data: {
        title: 'Яндекс (YNDX)',
        revenue: 218.3,
        net_profit: 21.0,
      }
    }
  end
  let(:block) do
    data
  end

  before :all do    
    @one_url_scraper = described_class.new(
      proxies: Sable::Proxies.new,
      headers: Sable::Headers.new,
      http_client: Sable::HttpClient.new)
  end

  it 'returns parsed data' do
    expect(@one_url_scraper.(url, block)).to  eq(data)
  end
end
