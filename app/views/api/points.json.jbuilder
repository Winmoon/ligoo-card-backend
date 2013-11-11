json.array!(@points) do |point|
  json.extract! point, :id, :establishment_id, :point_type
  json.extract! point.establishment, :name, :logo_urls, :cover
end
