json.array!(@establishments) do |establishment|
  json.extract! establishment, :name, :address, :phone, :description, :latitude, :longitude
  json.url establishment_url(establishment, format: :json)
end
