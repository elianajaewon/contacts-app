require "unirest"

puts "Choose an option:"
puts "1. Show one contact."
puts "2. Show all contacts."
puts 

input_option = gets.chomp

if input_option == "1"
  response = Unirest.get("http://localhost:3000/contact_url")
  contact = response.body
  p contact
elsif input_option == "2"
  response = Unirest.get("http://localhost:3000/show_all_url")
  contacts = response.body 
  p contacts
end 