class Coupon < ActiveRecord::Base
  belongs_to :user
  belongs_to :promotion
  has_many :points

  def register
    available_points = self.user.points.available.where(establishment_id: promotion.establishment.id).limit(promotion.points)
    if available_points.length == promotion.points
      if self.save
        available_points.each do |point|
          point.update_attribute :coupon_id, self.id
        end
        return true
      end
    else
      self.errors.add(:promotion_id, I18n.t("activerecord.attributes.promotion.errors.insufficient_points"))
    end
    false
  end

  def check
    if checked?
      self.errors.add(:promotion_id, I18n.t("activerecord.attributes.coupon.errors.already_checked", checked_at: I18n.l(self.updated_at, format: :default)))
      return false
    else
      self.update_attribute :checked, true
    end
    true
  end
end
