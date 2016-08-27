require "httparty"
require "nokogiri"
require "pry"

url = "https://www.kkday.com"
path = "/en/home/index2"

response = HTTParty.get(url, headers: {"User-Agent" => "Mozilla/5.0"})
page = Nokogiri::HTML(response)

results = {}
products = page.css(".home-product-view")
products.each do |product|
  image = product.css("img").first
  image_url = image["src"] if image
  title = product.css(".home-product-view-title").text.gsub(/\t+/, '')
  results[title] = image_url
end

puts results
