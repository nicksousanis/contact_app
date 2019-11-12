require "http"

puts "Would you like to see all contacts(1), see a specific contact(2), create a new contact(3), update an exisiting contact(4), or delete a contact(5)? Please enter the corresponding numnber:"
input = gets.chomp.to_i
if input == 1
  response = HTTP.get("http://localhost:3000/api/contacts")
  data = response.parse
  pp data
elsif input == 2
  puts "Please enter the id of the contact you would like to see."
  contact_id_show = gets.chomp
  response = HTTP.get("http://localhost:3000/api/contacts/#{contact_id_show}")
  data = response.parse
  pp data
elsif input == 3
  puts "Please enter the first name, last name, email and phone number of the new contact you would like to add in that order:"
  first_name = gets.chomp
  last_name = gets.chomp
  email = gets.chomp
  phone_number = gets.chomp
  response = HTTP.post("http://localhost:3000/api/contacts/", params: { first_name: first_name, last_name: last_name, email: email, phone_number: phone_number })
  # Doesn't work right now
  # elsif input == 4
  #   puts "Please enter the id of the contact you would like to change. Then enter in what you would like to change in this order. First name, last name, email, phone number. If you don't want to change a specific element, just enter 'nil'."
  #   contact_id_update = gets.chomp
  #   first_name = gets.chomp
  #   last_name = gets.chomp
  #   email = gets.chomp
  #   phone_number = gets.chomp

  #   response = HTTP.patch("http://localhost:3000/api/contacts/#{contact_id_update}", params: { first_name: first_name, last_name: last_name, email: email, phone_number: phone_number })
elsif input == 5
  puts "Please enter the id of the contact you would like to delete."
  contact_id_delete = gets.chomp
  response = HTTP.delete("http://localhost:3000/api/contacts/#{contact_id_delete}")
  puts "Contact successfully deleted!"
end
