class Point < ActiveRecord::Base
  belongs_to :user
  belongs_to :establishment
  validates :user, :establishment, :point_type, presence: true, length: { :minimum => 0 }
end
