class Promotion < ActiveRecord::Base

  belongs_to :establishment
  has_many :coupons

  validates :description, :points, :valid_until, presence: true
  validates :description, length: { maximum: 255 }
end
