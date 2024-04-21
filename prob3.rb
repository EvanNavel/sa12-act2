require 'httparty'

def get_time(area, location)
  response = HTTParty.get("http://worldtimeapi.org/api/timezone/#{area}/#{location}")
  response.parsed_response
end

area = 'America'
location = 'New_York'

time_data = get_time(area, location)

if time_data["datetime"]
  current_time = Time.parse(time_data["datetime"]).strftime("%Y-%m-%d %H:%M:%S")
  puts "The current time in #{area}/#{location} is #{current_time}."
else
  puts "Could not retrieve the current time for the location."
end
