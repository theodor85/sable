# frozen_string_literal: true

RSpec.describe Sable do
  it "has a version number" do
    expect(Sable::VERSION).not_to be nil
  end

  describe 'scrap' do
    let(:url_list) do
      [
        'https://smart-lab.ru/q/YNDX/f/y/MSFO/',
        'https://smart-lab.ru/q/PLZL/f/y/MSFO/',
        'https://smart-lab.ru/q/FIVE/f/y/MSFO/',
      ]
    end

    let(:result) do
      [
        {
          source_url: 'https://smart-lab.ru/q/YNDX/f/y/MSFO/',
          data: {
            title: 'Яндекс (YNDX)',
            revenue: 218.3,
            net_profit: 21.0,
          }
        },
        {
          source_url: 'https://smart-lab.ru/q/PLZL/f/y/MSFO/',
          data: {
            title: 'Полюс золото (PLZL)',
            revenue: 364.0,
            net_profit: 119.2,
          }
        },
        {
          source_url: 'https://smart-lab.ru/q/FIVE/f/y/MSFO/',
          data: {
            title: 'X5 Retail Group (FIVE)',
            revenue: 1978,
            net_profit: 28.3,
          }
        },
      ]
    end

    let(:handle_page) do |html|
      return result
    end

    before :all do
      one_url_scraper = Sable::OneUrlScraper.new
      @scraper = Sable::Scraper.new(one_url_scraper: one_url_scraper)
    end

    it "parse smartlab" do
      expect(@scraper.scrap(url_list) { |html| handle_page(html) }).to eq(result)
    end
  end
end
