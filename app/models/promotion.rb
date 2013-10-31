class Promotion < ActiveRecord::Base
  validates :description, :points, :valid_until, presence: true
  validates :description, length: { maximum: 255 }
end
