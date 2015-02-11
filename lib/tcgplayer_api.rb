require 'nokogiri'

class TCGplayerAPI
  VERSION = '0.0.1'
  BASE_URL = 'http://partner.tcgplayer.com/x3'

  # Fetch High/Mid/Low prices for the given card. If set_name is excluded,
  # returns the cheapest printing across all sets.
  def price_points(card_name, set_name=nil)
    request_params = {p: card_name}
    request_params[:s] = set_name unless set_name.to_s.strip.empty?
    get('/phl.asmx/p', request_params)
  end

  # Fetch prices from eight vendors for the given card printing.
  def vendor_prices(card_name, set_name=nil)
    request_params = {p: card_name, v: 8} # Default to the maximum of 8 results
    request_params[:s] = set_name unless set_name.to_s.strip.empty?
    get('/pv.asmx/p', request_params)
  end

private

  def get(endpoint, params)
    params[:pk] = 'TCGTEST'
  end

end
