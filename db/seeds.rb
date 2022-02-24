# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# require 'uri'
# require 'net/http'
# require 'openssl'

# url = URI("https://api.holded.com/api/invoicing/v1/contacts")

# http = Net::HTTP.new(url.host, url.port)
# http.use_ssl = true

# request = Net::HTTP::Get.new(url)
# request["Accept"] = 'application/json'
# request["key"] = ENV["HOLDED_API"]

# response = http.request(request)

# customers = JSON.parse(response.read_body)
#   customers.each do |customer|
#     Customer.create(
#       name: customer["name"],
#       code: customer["code"],
#       email: customer["email"],
#       mobile: customer["mobile"],
#       phone: customer["phone"]
#     )
#   end
# puts response["name"]

# array[0]['city']
# For all the cities

# cities = array.map{|k,v| k['city']}


############

# url = "http://tmdb.lewagon.com/movie/top_rated"
# 100.times do |i|
#   puts "Importing movies from page #{i + 1}"
#   movies = JSON.parse(open("#{url}?page=#{i + 1}").read)['results']
#   movies.each do |movie|
#     unless Movie.where(title: movie['title']).exists?
#     puts "Creating #{movie['title']}"
#     base_poster_url = "https://image.tmdb.org/t/p/original"
#     Movie.create(
#       title: movie['title'],
#       overview: movie['overview'],
#       poster_url: "#{base_poster_url}#{movie['backdrop_path']}",
#       rating: movie['vote_average']
#     )
#     end
#   end
# end
