class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :establishment
  counter_culture :establishment

  validates :user, :establishment, presence: true

  validates :user, uniqueness: { scope: :establishment }


end
