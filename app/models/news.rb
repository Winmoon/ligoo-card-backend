class News < ActiveRecord::Base

  belongs_to :establishment

  validates :news, presence: true, length: { maximum: 150 }

  validate :last_post

  def last_post
    errors.add(:news, I18n.t("activerecord.attributes.promotion.errors.last_post")) if News.where('establishment_id = ? and created_at > ?', self.establishment_id, 7.days.ago).exists?
  end

end
