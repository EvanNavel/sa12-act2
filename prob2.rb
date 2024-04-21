require 'httparty'

def fetch_crypto_data
  response = HTTParty.get("https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd")
  response.parsed_response
end

def top_crypto(data)
  data.sort_by { |crypto| -crypto['market_cap'] }.first(5)
end

crypto_data = fetch_crypto_data
top_crypto = top_crypto(crypto_data)

puts "Top 5 Cryptocurrencies by Market Capitalization:"
top_crypto.each do |crypto|
  puts "#{crypto['name']} - Price: $#{crypto['current_price']}, Market Cap: $#{crypto['market_cap']}"
end
