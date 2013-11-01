class Promotion < ActiveRecord::Base

  belongs_to :establishment

  validates :description, :points, :share_points, :valid_until, presence: true
  validates :description, length: { maximum: 255 }
end
