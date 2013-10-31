class Establishment < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_attached_file :logo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates :name, :address, :phone, presence: true, length: { maximum: 255 }
  validates :latitude, :longitude, presence: true
  validates :logo, :attachment_presence => true
  validates :description, length: { maximum: 420 }
end
