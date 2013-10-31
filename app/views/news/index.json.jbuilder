json.array!(@news) do |news|
  json.extract! news, :name, :address, :phone, :description, :latitude, :longitude
  json.url news_url(news, format: :json)
end
