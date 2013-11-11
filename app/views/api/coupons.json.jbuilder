json.array!(@coupons) do |coupon|
  json.extract! coupon, :id, :promotion, :points, :checked, :created_at
  json.establishment coupon.promotion.establishment
end
