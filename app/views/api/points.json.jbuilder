json.array!(@points) do |point|
  json.extract! point, :id, :establishment_id, :point_type, :coupon_id
  json.extract! point.establishment, :name, :logo_urls, :cover
end
