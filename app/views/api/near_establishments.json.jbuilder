json.array!(@establishments) do |establishment|
  json.extract! :id, :name, :address, :phone, :description, :latitude, :longitude, :logo_urls, :cover
  json.distance establishment.distance
end
