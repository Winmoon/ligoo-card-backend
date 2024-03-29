json.array!(@news) do |news|
  json.extract! news, :id, :created_at, :news
  json.establishment do
    json.extract! news.establishment, :id, :name, :address, :phone, :description, :latitude, :longitude, :logo_urls, :cover
  end
end
