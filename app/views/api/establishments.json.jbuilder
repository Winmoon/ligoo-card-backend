json.array!(@establishments) do |establishment|
  json.extract! establishment[0], :id, :name, :address, :phone, :description, :latitude, :longitude, :logo_urls
  json.points establishment[1]
end
