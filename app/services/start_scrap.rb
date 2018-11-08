
require 'rubygems'
require 'nokogiri'
require 'open-uri'

class StartScrap

    def initialize
      @page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))

    end
  def perform
    list_line = @page.xpath('//*[@id="currencies-all"]/tbody/tr')

    list_currencies = Array.new

    list_line.each { | line |
    coin = Hash.new
    currency = line.xpath('td[2]/a')
    rates = line.xpath('td[8]')
    coin['currency'] = currency.text
    coin['rates'] = rates.text
    list_currencies.push(coin)}
        return (list_currencies)
    end

    def save
        Crypto.destroy_all
        list_currencies = perform
        puts list_currencies
        list_currencies.each do |hash|
            Crypto.create(cryptoname: hash['currency'], value: hash['rates'])
        end
    end
end


