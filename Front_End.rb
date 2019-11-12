require "http"

response = HTTP.get("http://localhost:3000/api/first_contact_url")

data = response.parse
p data
