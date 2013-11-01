json.array!(@points) do |point|
  json.extract! point, :user_id, :establishment_id, :point_type
end
