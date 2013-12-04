json.array!(@cards) do |card|
  json.extract! card, :id, :establishment_id, :user_id
  json.extract! card.establishment, :name, :logo_urls, :cover
end
