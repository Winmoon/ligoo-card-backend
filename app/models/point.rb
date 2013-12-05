class Point < ActiveRecord::Base
  belongs_to :user
  belongs_to :establishment
  belongs_to :coupon
  validates :user, :establishment, :point_type, presence: true, length: { :minimum => 0 }
  scope :available, where('coupon_id is null').order('created_at asc')
  scope :used, where('coupon_id is not null').order('created_at asc')
  scope :qrcode_points, where('point_type = ?', :qrcode)
  scope :share_points, where('point_type = ?', :share)

  validate :daily_limit

  def daily_limit
    errors.add(:point_type, I18n.t("activerecord.attributes.point.errors.daily_limit")) if establishment.daily_point_limit? && user.points.qrcode_points.where('establishment_id = ? and created_at > ?', establishment.id, 1.day.ago).exists?
    errors.add(:point_type, I18n.t("activerecord.attributes.point.errors.daily_share_limit")) if establishment.daily_point_limit? && user.points.share_points.where('establishment_id = ? and created_at > ?', establishment.id, 1.day.ago).exists?
  end
end
