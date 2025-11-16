require "json"
require "http/client"

class FxFeed
  API_PATH = "v1"
  def initialize(@api_key : String)
    @headers = HTTP::Headers {
      "Content-Type" => "application/json",
      "User-Agent" => "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36"
    }
    uri = URI.parse("https://api.fxfeed.io")
    @http_client = HTTP::Client.new(uri)
  end

  def get_latest_rates(base : String, currencies : String) : JSON::Any
    JSON.parse(
      @http_client.get(
        "/#{API_PATH}/latest?base=#{base}&currencies=#{currencies}&api_key=#{@api_key}",
        headers: @headers).body)
  end

  def get_historical_rates(
      base : String, currencies : String, date : String) : JSON::Any
    JSON.parse(
      @http_client.get(
        "/#{API_PATH}/latest?base=#{base}&currencies=#{currencies}&date=#{date}&api_key=#{@api_key}",
        headers: @headers).body)
  end

  def convert_price(
      from : String, to : String, amount : Int32) : JSON::Any
    JSON.parse(
      @http_client.get(
        "/#{API_PATH}/convert?from=#{from}&to=#{to}&amount=#{amount}&api_key=#{@api_key}",
        headers: @headers).body)
  end
end
