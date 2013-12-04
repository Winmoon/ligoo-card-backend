class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  has_many :points
  has_many :establishments, through: :points
  has_many :likes
  has_many :coupons
  has_many :cards



  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create(name:auth.extra.raw_info.name,
                         provider:auth.provider,
                         uid:auth.uid,
                         email:auth.info.email,
                         password:Devise.friendly_token[0,20]
      )
    end
    user
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def self.search(search)
    if search
      where('name LIKE :q or email LIKE :q', q: "%#{search}%")
    else
      all
    end
  end

  def age
    ((Time.now.to_time - self.birth_date.to_time) / 1.years).to_i
  end

  def card(establishment_id)
    cards.find_or_create_by(establishment_id: establishment_id)
  end
end
