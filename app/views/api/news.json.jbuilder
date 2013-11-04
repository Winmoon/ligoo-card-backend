json.array!(@news) do |news|
  json.extract! news, :created_at, :news
  json.establishment do
    json.extract! news.establishment, :name, :address, :phone, :description, :latitude, :longitude, :logo_urls
  end
end
