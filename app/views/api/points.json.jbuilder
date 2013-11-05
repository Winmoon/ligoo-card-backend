json.array!(@points) do |point|
  json.extract! point, :id, :establishment_id, :point_type
end
