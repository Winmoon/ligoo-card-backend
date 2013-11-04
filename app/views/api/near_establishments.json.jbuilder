json.array!(@establishments) do |establishment|
  json.extract! establishment, :name, :address, :phone, :description, :latitude, :longitude, :logo_urls
  json.distance establishment.distance
end
