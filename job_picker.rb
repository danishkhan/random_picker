require 'rubygems'
require 'open-uri'
require 'nokogiri'

# method that will get all the links using Nokogiri
def get_random_href(page)
  doc = Nokogiri::HTML(open(page))
  links = doc.css('li.job h4 a').map { |link| link['href']}
  job_board_size = links.length
  return system("open http://jobs.engineyard.com/#{links[rand(max=job_board_size)]}")
end

# puts "What URL do you want to open?"
# location = gets.chomp
location = "http://jobs.engineyard.com/"
get_random_href(location)
