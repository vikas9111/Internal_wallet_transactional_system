class LatestStockPrice
  def fetch_available_stocks(identifier: nil)
    require 'uri'
    require 'net/http'

    
    url = URI("https://latest-stock-price.p.rapidapi.com/any")

    url.query = URI.encode_www_form({Identifier: identifier}) if identifier

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["X-RapidAPI-Key"] = '6a9fb204damsh02c4b09a631c675p11e78fjsnf40e58dbb4fe'
    request["X-RapidAPI-Host"] = 'latest-stock-price.p.rapidapi.com'
    
    response = http.request(request)
    all_stocks = JSON.parse(response.read_body)
    all_stocks.map { |hash| hash.slice('symbol', 'identifier', 'lastPrice') }
  end
end