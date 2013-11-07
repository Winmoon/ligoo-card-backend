json.array!(@establishments) do |establishment|
  json.extract! establishment, :id, :name, :address, :phone, :description, :latitude, :longitude, :logo_urls, :cover
  json.distance establishment.distance
end
