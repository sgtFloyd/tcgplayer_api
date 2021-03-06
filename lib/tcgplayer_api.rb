require 'active_support/core_ext/hash/conversions'
require 'open-uri'

class TCGplayerAPI
  VERSION = '0.0.4'

  class << self
    attr_accessor :partner_key, :logger
    BASE_URL = 'http://partner.tcgplayer.com/x3'

    # Fetch High/Mid/Low prices for the given card. If set_name is excluded,
    # returns the cheapest printing across all sets.
    def price_points(card_name, set_name=nil)
      request_params = {p: card_name}
      request_params[:s] = set_name unless set_name.to_s.strip.empty?
      response = get('/phl.asmx/p', request_params)
      @logger.info("RESPONSE #{response}") if @logger
      raise response['error']['message'] if response['error']
      return response['products']['product']
    end

    # Fetch prices from eight vendors for the given card printing.
    def vendor_prices(card_name, set_name=nil)
      request_params = {p: card_name, v: 8} # Default to the maximum of 8 results
      request_params[:s] = set_name unless set_name.to_s.strip.empty?
      response = get('/pv.asmx/p', request_params)
      @logger.info("RESPONSE #{response}") if @logger
      raise response['error']['message'] if response['error']
      return response['prices']
    end

  private

    def get(endpoint, params)
      params[:pk] = partner_key || 'TCGTEST'
      encoded_params = '?' + URI.encode_www_form(params)
      url = [BASE_URL, endpoint, encoded_params].join
      @logger.info "GET #{url}" if @logger
      return Hash.from_xml open(url)
    end

  end
end
