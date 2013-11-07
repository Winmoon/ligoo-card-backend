class Point < ActiveRecord::Base
  belongs_to :user
  belongs_to :establishment
  validates :user, :establishment, :point_type, presence: true, length: { :minimum => 0 }
  scope :available, where('coupon_id is null').order('created_at asc')
  scope :used, where('coupon_id is not null').order('created_at asc')

  validate :daily_limit

  def daily_limit
    errors.add(:news, I18n.t("activerecord.attributes.point.errors.daily_limit")) if establishment.daily_point_limit? && user.points.where('establishment_id = ? and created_at > ?', establishment.id, 1.day.ago).exists?
  end
end
