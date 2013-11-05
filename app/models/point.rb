class Point < ActiveRecord::Base
  belongs_to :user
  belongs_to :establishment
  validates :user, :establishment, :point_type, presence: true, length: { :minimum => 0 }
  scope :available, where('coupon_id is null').order('created_at asc')
  scope :used, where('coupon_id is not null').order('created_at asc')

end
