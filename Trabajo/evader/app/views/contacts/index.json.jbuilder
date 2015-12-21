json.array!(@contacts) do |contact|
  json.extract! contact, :id, :client_id, :type, :value
  json.url contact_url(contact, format: :json)
end
