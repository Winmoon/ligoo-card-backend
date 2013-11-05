class Establishment < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :logo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"

  geocoded_by :address, :latitude  => :latitude, :longitude => :longitude

  has_many :promotions

  has_many :news
  has_many :likes

  validates :name, :address, :phone, presence: true, length: { maximum: 255 }
  validates :latitude, :longitude, presence: true
  validates :logo, :attachment_presence => true
  validates :description, length: { maximum: 420 }

  def logo_urls
    { :original => logo, :medium => logo(:medium), :thumb => logo(:thumb) }
  end
end
