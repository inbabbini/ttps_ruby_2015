json.array!(@clients) do |client|
  json.extract! client, :id, :first_name, :last_name, :birthdate, :gender, :cui, :phone, :mail, :skype, :address
  json.url client_url(client, format: :json)
end
