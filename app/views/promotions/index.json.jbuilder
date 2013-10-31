json.array!(@promotions) do |promotion|
  json.extract! promotion, :name, :address, :phone, :description, :latitude, :longitude
  json.url promotion_url(promotion, format: :json)
end
