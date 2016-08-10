# Adri's Weather App with Ruby & Barometer Gem

# Call out Barometer gem
require 'barometer'


# Using Barometer gem
def get_locations_weather(location)
     Barometer.new(location).measure
end

# Ask for the user's location
puts "Welcome to the Weather app! Not sure if you need an umbrella or a jacket today? Find out by adding your current location for today:"
location = gets.chomp.downcase

# Give the user today's weather results based on current location and today's date
weather = get_locations_weather(location)
tomorrow = Time.now.strftime('%d').to_i + 1

weather.forecast.each do |forecast|
     day = forecast.starts_at.day
     
     if day == tomorrow
          dayName = 'Tomorrow'
     else
          dayName = forecast.starts_at.strftime('%A')
     end
     
     puts dayName + ' is going to be ' + forecast.icon + ' with a low of ' + forecast.low.f.to_s + ' and a high of ' + forecast.high.f.to_s
end