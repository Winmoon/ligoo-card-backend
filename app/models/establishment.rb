class Establishment < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :logo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  has_attached_file :cover, :default_url => "/images/:style/missing.png"

  geocoded_by :address, :latitude  => :latitude, :longitude => :longitude

  has_many :promotions
  has_many :news
  has_many :likes
  has_many :coupons, through: :promotions
  has_many :points
  has_many :users, through: :cards
  has_many :cards

  validates :name, :address, :phone, presence: true, length: { maximum: 255 }
  validates :fidelity_card, length: { maximum: 255 }
  validates :latitude, :longitude, :share_points, presence: true
  validates :logo, :cover, :attachment_presence => true
  validates :description, length: { maximum: 420 }

  def latitude=(latitude)
    write_attribute(:latitude, latitude.gsub(',', '.'))
  end

  def longitude=(longitude)
    write_attribute(:longitude, longitude.gsub(',', '.'))
  end



  def logo_urls
    { :original => logo, :medium => logo(:medium), :thumb => logo(:thumb) }
  end
end
