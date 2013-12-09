class Card < ActiveRecord::Base
  belongs_to :user
  belongs_to :establishment

  def avaliable_points
    self.user.avaliable_establishment_points(self.establishment.id).count
  end
end
