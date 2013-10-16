class Establishment < ActiveRecord::Base
  has_attached_file :logo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
end
