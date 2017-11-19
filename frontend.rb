require "unirest"
require "pp"

puts "Welcome to my Contacts App!"
puts 
puts "Please choose one of the following options:"
puts "[1] Show all contacts."
puts "[2] Show one contact."
puts "[3] Create new contact."
puts "[4] Update a contact."
puts "[5] Delete a contact."

input_option = gets.chomp 

if input_option == "1"
  response = Unirest.get("http://localhost:3000/contacts")
  contacts = response.body
  pp contacts 
elsif input_option == "2"
  puts "Please choose a contact ID:"
  contact_id = gets.chomp 
  response = Unirest.get("http://localhost:3000/contacts/#{contact_id}")
  contact = response.body
  pp contact
elsif input_option == "3"
  params = {}
  puts "Enter first name:"
  params["first_name"] = gets.chomp
  puts "Enter last name:"
  params["last_name"] = gets.chomp
  puts "Enter email:"
  params["email"] = gets.chomp
  puts "Enter phone number:"
  params["phone_number"] = gets.chomp
  response = Unirest.post("http://localhost:3000/contacts/:id", parameters: params)
  contact = response.body
  pp contact
elsif input_option == "4"
  puts "Which contact ID would you like to update?"
  contact_id = gets.chomp 
  params = {}
  puts "Enter new first name:"
  params["first_name"] = gets.chomp
  puts "Enter new last name:"
  params["last_name"] = gets.chomp
  puts "Enter new email:"
  params["email"] = gets.chomp
  puts "Enter new phone number:"
  params["phone_number"] = gets.chomp
  response = Unirest.patch("http://localhost:3000/contacts/#{contact_id}", parameters: params)
  contact = response.body
  pp contact 
elsif input_option == "5"
  puts "Which contact would you like to delete?"
  contact_id = gets.chomp 
  response = Unirest.delete("http://localhost:3000/contacts/#{contact_id}")
  pp response.body
end 
