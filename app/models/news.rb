class News < ActiveRecord::Base

  belongs_to :establishment

  validates :news, presence: true, length: { maximum: 150 }

  validate :last_post

  def last_post
    errors.add(:news, I18n.t("activerecord.attributes.news.errors.last_post")) if self.new_record? && establishment.news.where('created_at > ?', 7.days.ago).exists?
  end

end
